class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password]) && user.confirmed?
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    elsif user.confirmed? == false
      flash.now.alert = "Email has not been confirmed! Check your email for the confirmation link."
      render "new"
    else  
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
