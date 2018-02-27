Rails.application.routes.draw do
  root to: 'pages#home'

  PagesController.action_methods.each do |action|
    get "/#{action}", to: "pages##{action}", as: "#{action}"
  end
end
