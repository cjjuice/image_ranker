class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def index
    redirect_to images_path if current_user 
  end

  def create
    @user = User.create(params[:user])
    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      redirect_to root_url, notice: "Thank you for signing up! Check your email to validate your account"
    else
      render "new"
    end
  end
  
  def check_confirm_code
    if params[:user_id] && params[:confirmation_code]
      user = User.find(params[:user_id])
      if user.confirmation_code == params[:confirmation_code]
        user.confirm!
        session[:user_id] = user.id
        redirect_to images_path, notice: "Email confirmed! Welcome to Image Ranker!"
      else
        redirect_to root_url, alert: "Email confirm code did not match!"
      end
    else
      redirect_to root_url
    end  
  end            
end
