class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:article_id])
    @article_types = ArticleType.includes(:translations)
  end
end
