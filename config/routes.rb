Rails.application.routes.draw do
  scope '(:locale)', locale: /it|en/ do
    root 'pages#home'

    PagesController.action_methods.each do |action|
      get "/#{action}", to: "pages##{action}", as: "#{action}"
    end
  end
end
