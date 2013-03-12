class Image < ActiveRecord::Base
 
  attr_accessible :image_url 
  
  belongs_to :user
  
  has_reputation :votes, source: :user, aggregated_by: :sum
  
  validates_presence_of :image_url , :message => "Must submit an image!"
  validates_format_of   :image_url , :with => %r{\.(jpg|gif|png)$}i , :message => "Link must be an image!"
  
  self.per_page = 16
end
