class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  has_secure_password 
  validates_length_of :username, :maximum => 15, :message => "less than %d if you don't mind"
  validates_uniqueness_of :email, :message => "Email already registered."
  validates_uniqueness_of :username , :message => "Username already taken. Try again!"
  validates_presence_of :username, :email, :password_digest , :message => "You must complete them all!"
  
  has_many :images
  
  has_many :evaluations, class_name: "RSEvaluation", as: :source

  #has_reputation :votes, source: {reputation: :votes, of: :images}, aggregated_by: :sum

  def voted_for?(image)
    evaluations.where(target_type: image.class, target_id: image.id).present?
  end
  
end
