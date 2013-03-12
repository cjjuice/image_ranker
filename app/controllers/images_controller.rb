class ImagesController < ApplicationController

  before_filter :authorize

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.create(params[:image])
    if @image.save
    	redirect_to root_url, notice: "Image submitted!"
    else
    	redirect_to :back, alert: "Make sure you are submitting a valid image link!"
    end
  end

  def index
    @images = Image.page(params[:page]).find_with_reputation(:votes, :all, :order => "rs_reputations.value/(((#{Time.now.tv_sec} - EXTRACT (EPOCH FROM images.created_at))/3600) + 2)^1.5 DESC")
  end
  
  def vote
    begin
      value = params[:type] == "up" ? 1 : -1
      @image = Image.find(params[:id])
      @image.add_or_update_evaluation(:votes, value, current_user) 
    rescue  
      redirect_to :back, alert: "You must login to vote!"
    else  
      redirect_to :back, notice: "Thank you for voting!"
    end
  end
  
  def destroy
    Image.destroy(params[:id])
    redirect_to :back, notice: "Image deleted!"
  end  
end
