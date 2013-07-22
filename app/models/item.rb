class Item < ActiveRecord::Base
  attr_accessible :detail, :title, :user, :image, :url, :price, :currency_type
  #extend Enumerize
  #enumerize :currency_type, in: [:dollar, :pound], default: :dollar
  
  belongs_to :wish
  
  mount_uploader :image, AvatarUploader
   
end
