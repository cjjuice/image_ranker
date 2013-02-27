class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def index
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      current_user = User.find_by_email(params[:user][:email])
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end
end
