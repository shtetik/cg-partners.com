class ArticleTypesController < ApplicationController
  def show
    @article_types = ArticleType.includes(:translations)
    @article_type = @article_types.find(params[:article_type_id])
    @articles = @article_type.articles
      .published
      .for_site
      .order(created_at: :desc)
  end
end
