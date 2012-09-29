class Image < ActiveRecord::Base
 
  attr_accessible :image_url 
  
  belongs_to :user
  
  has_reputation :votes, source: :user, aggregated_by: :sum
  
  validates_presence_of :image_url
  
end
