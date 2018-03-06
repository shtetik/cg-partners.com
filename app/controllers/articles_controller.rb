class ArticlesController < ApplicationController
  def index
    @articles = Article
      .includes({ article_type: :translations }, :translations)
      .order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end
end
