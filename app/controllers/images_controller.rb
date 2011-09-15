class ImagesController < ApplicationController
  before_filter :load_block

  def index
	@images = @block.images
  end

  def edit
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id])
  end
  
  def create
	@image = Image.new(params[:image])
	@image.block = @block
	if @image.save
	  redirect_to [@block.article, @block, @image], :notice => "Image was successfully created."
	else
	  render action: "new"
	end
  end
  
  def update
	@image = Image.find(params[:id])
	if @image.update_attributes(params[:image])
	  redirect_to [@block.article, @block, @image], :notice => "Image was successfully saved."
	else
	  render action: "edit"
	end
  end
  
  def destroy
    @image = Image.find(params[:id])
	@image.destroy
	redirect_to article_block_images_path(params[:article_id], params[:block_id])
  end
  private
  
  def load_block
    @block = Block.find(params[:block_id])
  end

end
