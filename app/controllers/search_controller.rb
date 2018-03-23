class SearchController < ApplicationController
  layout false

  def index
    @query = params[:query].presence

    @articles = Article.with_translations()
                       .where('(title||description||text) ILIKE ?', "%#{@query}%")

    @services = Service.with_translations(I18n.locale)
                       .where('(title||text) ILIKE ?', "%#{@query}%")

    @people = Person.with_translations(I18n.locale)
                    .where('(full_name||text) ILIKE ?', "%#{@query}%")

    @total_size = @articles.size + @services.size + @people.size
  end
end
