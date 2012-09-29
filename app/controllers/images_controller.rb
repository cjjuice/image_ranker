class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params[:image])
    @image.user_id = current_user.id if current_user
      if @image.save
    			redirect_to root_url, notice: "Thank you for signing up!"
    	else
    			render "new"
    	end
  end

  def index
    @images = Image.find_with_reputation(:votes, :all, order: 'votes desc')
  end
  
  def vote
    value = params[:type] == "up" ? 1 : -1
    @image = Image.find(params[:id])
    @image.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting!"
  end
  
  def destroy
    Image.destroy(params[:id])
    redirect_to :back, notice: "Image deleted!"
  end  
end
