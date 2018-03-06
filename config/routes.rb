Rails.application.routes.draw do
  scope '(:locale)', locale: /it|en/ do
    root 'pages#home'

    PagesController.action_methods.each do |action|
      get "/#{action}", to: "pages##{action}", as: "#{action}"
    end

    resources :services, only: [:index, :show]
    resources :articles, only: [:index, :show]
    resources :people, only: [:index, :show]

    get 'focus/:article_type_id', to: 'article_types#show', as: 'focus'
  end
end
