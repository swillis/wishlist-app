class UserMailer < ActionMailer::Base
  
    def sent(sender,recipt,message)
      @sender = sender
      @recipt= recipt
      @message = message
      mail(:from => @sender ,:to => recipt.email, :subject => "Your Reward")
      
    end
    
    def welcome_email(user,message)
       
      @user= user
      @message = message
      mail(:from => "info@accomplist.com" ,:to => user.email, :subject => "Welcome to Accomplist")      
    end
      
 end
