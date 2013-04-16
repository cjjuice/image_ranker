class SessionsController < ApplicationController
  before_filter :load_school
  
  def new
  end

  def create
    user = @school.users.find_by_username(params[:username].downcase)
    if user && user.authenticate(params[:password])
      if user.confirmed?
        session[:user_id] = user.id
        redirect_to root_url(subdomain: @school.subdomain), notice: "Logged in!"
      else
        flash.now.alert = "Email has not been confirmed! Check your email spam folder for the confirmation link."
        render "new"  
      end  
    else  
      flash.now.alert = "Username or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url(subdomain: @school.subdomain), notice: "Logged out!"
  end
end
