class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  attr_reader :admin
  has_secure_password 
  
  uri_email_regex = /\A[\w+\-.]+@my\.uri\.edu\z/i
  
  validates_length_of :username, :maximum => 15
  validates_uniqueness_of :email
  validates_uniqueness_of :username  
  validates_presence_of :username, :email, :password, :password_confirmation
  validates :email, :email => { :message => "Must be a valid email." }
  
  has_many :images
  has_many :comments
  
  has_many :evaluations, class_name: "RSEvaluation", as: :source

  def voted_for?(image)
    evaluations.where(target_type: image.class, target_id: image.id).present?
  end
  
  def confirm!
    self.confirmation_code = nil
    self.confirmed = true
    self.save(:validate => false)
  end
  
  before_create :set_confirmation_code
  
  def set_confirmation_code
    self.confirmation_code = loop do
      random_token = SecureRandom.urlsafe_base64
      break random_token unless User.where(confirmation_code: random_token).exists?
    end
    self.confirmed = false
    return true # must return true in order for ActiveRecord to save 
  end 
  
  def send_password_reset
    self.password_reset_token = loop do
      random_token = SecureRandom.urlsafe_base64
      break random_token unless User.where(password_reset_token: random_token).exists?
    end
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end 
end
