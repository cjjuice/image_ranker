class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  has_secure_password 
  
  validates_length_of :username, :maximum => 15
  validates_uniqueness_of :email
  validates_uniqueness_of :username  
  validates_presence_of :username, :email, :password, :password_confirmation
  
  has_many :images
  
  has_many :evaluations, class_name: "RSEvaluation", as: :source

  def voted_for?(image)
    evaluations.where(target_type: image.class, target_id: image.id).present?
  end
  
end
