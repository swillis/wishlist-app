class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  attr_accessible :bio, :gender, :profile_image
  mount_uploader :profile_image, AvatarUploader
  
  has_many :wishes
  after_create :email_welcome
  
  def email_welcome
    UserMailer.welcome_email(self, "Thankyou very much for registeration").deliver    
  end
  
  
end
