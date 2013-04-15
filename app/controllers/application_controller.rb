class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "Please Sign In!" if current_user.nil?
  end
  
  def load_school
    @school = School.find_by_subdomain!(request.subdomain)
  end
end
