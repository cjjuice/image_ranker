class School < ActiveRecord::Base
  attr_accessible :email_domain, :name, :subdomain
  has_many :users
  has_many :images
  
  validates_presence_of :email_domain, :name, :subdomain
end
