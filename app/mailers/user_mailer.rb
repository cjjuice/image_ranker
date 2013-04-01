class UserMailer < ActionMailer::Base
  default from: "imageranker@image-ranker.herokuapp.com"

  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "ImageRanker Sign Up Confirmation"
  end
  
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password Reset"
  end  
end
