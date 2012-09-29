class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password 
  validates_uniqueness_of :email
  validates_presence_of :email, :password_digest
  
  has_many :images
  
  has_many :evaluations, class_name: "RSEvaluation", as: :source

  #has_reputation :votes, source: {reputation: :votes, of: :images}, aggregated_by: :sum

  def voted_for?(image)
    evaluations.where(target_type: image.class, target_id: image.id).present?
  end
  
end
