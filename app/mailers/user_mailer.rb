class UserMailer < ActionMailer::Base
  default from: "no-reply@imageranker.co"

  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "ImageRanker Sign Up Confirmation"
  end
  
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "ImageRanker Password Reset"
  end  
end
