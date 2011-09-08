class BlocksController < ApplicationController
  before_filter :get_article
  before_filter :set_params, :only => [:create, :update]
  
  def index
    @blocks = Block.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blocks }
    end
  end

  def show
    @block = Block.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @block }
    end
  end

  def new
    @block = Block.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @block }
    end
  end

  def edit
    @block = Block.find(params[:id])
  end

  def create
    @block = Block.new(params[:block])
    @block.article = @article
    @block.block_type = "Text"
    respond_to do |format|
      if @block.save
        format.html { redirect_to @block, notice: 'Block was successfully created.' }
        format.json { render json: @block, status: :created, location: @block }
      else
        format.html { render action: "new" }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @block = Block.find(params[:id])

    respond_to do |format|
      if @block.update_attributes(params[:block])
        format.html { redirect_to @block, notice: 'Block was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @block = Block.find(params[:id])
    @block.destroy

    respond_to do |format|
      format.html { redirect_to blocks_url }
      format.json { head :ok }
    end
  end
  
  private
  
  def get_article
    @article = Article.find(params[:article_id])
  end
  
  def set_params
    params[:block][:article_id] = params[:article_id]
  end
end
