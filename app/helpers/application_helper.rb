module ApplicationHelper
  def locale_path(locale = I18n.default_locale)
    locales = I18n.available_locales.join('|')
    path = request.fullpath.sub!(/^\/(?:#{locales})(\/|$)/, "/#{locale}#{'\1'}")
    path || root_path(locale: locale)
  end
end
