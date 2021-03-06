Rails.application.routes.draw do
  get '/admin/:id' => 'admin#show', as: "admin"


#need to clean up routes -- trim routes
  resources :articles, only: [:index]
  resources :users, only: [:index, :update, :destroy]

  get '/articles/new' => 'articles#new'

  resources :categories do
    resources :articles
  end
  # get '/categories/:id/articles' => 'categories#show', as: 'category_articles'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => "users#new"
  post '/users/' => "users#create"

  root "main#index"


end
