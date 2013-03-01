class UserMailer < ActionMailer::Base
  default from: "imageranker@gmail.com"

  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "ImageRanker Sign Up Confirmation"
  end
end
