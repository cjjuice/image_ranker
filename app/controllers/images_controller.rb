class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params[:image])
      if @image.save
    			redirect_to root_url, notice: "Thank you for signing up!"
    	else
    			render "new"
    	end
  end

  def index
    @images = Image.all
  end
end
