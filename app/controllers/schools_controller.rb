class SchoolsController < ApplicationController
  def index
    @schools = School.order("name")
    render :layout => nil
  end
  
  def show
    @school = School.find_by_subdomain!(request.subdomain)
  end    
end
