class BlocksController < ApplicationController
  before_filter :get_article
  before_filter :set_params, :only => [:create, :update]
  
  def index
    @blocks = @article.blocks
  end

  def show
    @block = Block.find(params[:id])
  end

  def new
    @block = Block.new
  end

  def edit
    @block = Block.find(params[:id])
  end

  def create
    @block = Block.new(params[:block])
    @block.article = @article
    @block.block_type = "Text"
    if @block.save
      redirect_to @block.article, notice: 'Block was successfully created.' 
	else
      render action: "new"
    end
  end

  def update
    @block = Block.find(params[:id])

    if @block.update_attributes(params[:block])
      redirect_to @block, notice: 'Block was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @block = Block.find(params[:id])
    @block.destroy
    
    redirect_to article_blocks_url(@article)
  end
  
  private #-------------------------------------------
  
  def get_article
    @article = Article.find(params[:article_id])
  end
  
  def set_params
    params[:block][:article_id] = params[:article_id]
  end
end
