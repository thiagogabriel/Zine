class ReadController < ApplicationController
  def index
    @articles = Article.all
  end

  def article
    @article = Article.find(params[:id])
    @blocks = @article.blocks.sort_by { |block| block.order }
  end

end
