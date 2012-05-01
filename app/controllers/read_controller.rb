class ReadController < ApplicationController
  def index
    @articles = Article.where("publish_at <= ?", Time.now).order(" publish_at DESC").limit(30)
    @next = @articles[0]
  end

  def article
    @article = Article.find(params[:id])
    @blocks = @article.blocks.sort_by { |block| block.order }
    @next = Article.where("publish_at <= ? AND id <> ?", @article.publish_at, @article.id).order("publish_at DESC").limit(1)[0]
  end

end
