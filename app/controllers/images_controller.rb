class ImagesController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  before_filter :load_school

  def new
    @image = Image.new
  end
  
  def show
     @image = @school.images.find(params[:id])
     @commentable = @image
     @comments = @commentable.comments.order('created_at')
     @comment = Comment.new
  end

  def create
    @image = current_user.school.images.create(params[:image])
    if @image.save
    	redirect_to images_path, notice: "Image submitted!"
    else
    	redirect_to :back, alert: "Make sure you are submitting a valid image link!"
    end
  end

  def index
    if params[:sort] == "new" 
      @images = @school.images.page(params[:page]).find_with_reputation(:votes, :all, :order => "created_at DESC")
    else 
      @images = @school.images.page(params[:page]).find_with_reputation(:votes, :all, :order => "rs_reputations.value/(((#{Time.now.tv_sec} - EXTRACT (EPOCH FROM images.created_at))/3600) + 2)^1.5 DESC")
    end    
  end
  
  def vote
    begin
      value = params[:type] == "up" ? 1 : -1
      @image = @school.images.find(params[:id])
      if current_user.admin? == true
        @image.increase_evaluation(:votes, value, current_user)
      else  
        @image.add_or_update_evaluation(:votes, value, current_user)
      end   
    rescue  
      redirect_to :back, alert: "You must login to vote!"
    else  
      redirect_to :back, notice: "Thank you for voting!"
    end
  end
  
  def destroy
    @school.images.destroy(params[:id])
    redirect_to :back, notice: "Image deleted!"
  end  
end
