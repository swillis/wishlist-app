class Wish < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  def should_generate_new_friendly_id?
    new_record? || slug.blank?  
  end
  
  belongs_to :user
  
  has_many :items
  
  attr_accessible :close_date, :status, :title , :description , :image
  validates :close_date  ,:presence => true
  mount_uploader :image, AvatarUploader
  
  def self.completed
    where(:status => "completed")
  end
  
  def self.inprogress
    where(:status => "inprogress")
  end
  
 
  
end
