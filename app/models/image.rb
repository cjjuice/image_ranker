class Image < ActiveRecord::Base
 
  attr_accessible :image_url 
  
  belongs_to :user
  
  has_reputation :votes, source: :user, aggregated_by: :sum
  
  validates_presence_of :image_url , :message => "Must submit an image!"
  validates_format_of   :image_url , :with => %r{\.(jpg|gif|png)$}i , :message => "Link must be an image!"
  
  scope :ordered_by_score, lambda { order_by_score }

  def self.order_by_score
    age_in_hours = "(#{Time.now.tv_sec} - EXTRACT (EPOCH FROM images.created_at))/3600"
    total_score = "(rs_reputations.value - 1)/((#{age_in_hours}) + 2)^1.5"

    joins("INNER JOIN rs_reputations ON rs_reputations.target_id = images.id").where("rs_reputations.target_type = 'Image'").order("#{total_score} DESC")
  end
end
