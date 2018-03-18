module ApplicationHelper
  def other_locale
    (I18n.available_locales - [locale]).shift
  end

  def locale_path(locale = other_locale)
    locales = I18n.available_locales.join('|')
    path = request.fullpath.sub!(/^\/(?:#{locales})(\/|$)/, "/#{locale}#{'\1'}")
    path || root_path(locale: locale)
  end

  def object_locale_path(object, locale = other_locale)
    id_key =
      if params[:article_id].present?
        :article_id
      else
        :id
      end

    url_for id_key => object.send(:"slug_#{other_locale}"), locale: locale
  end
end
