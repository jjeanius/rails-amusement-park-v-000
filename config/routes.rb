Rails.application.routes.draw do
  resources :users
  resources :attractions
  resource :rides, only: [:new, :create]


  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy'
  get '/signout', to: 'sessions#destroy'

  post '/rides/create', to: 'rides#create'
  get '/rides/new', to: 'rides#new'

  root 'welcome#home'nemespace :user_admin do
  resources :user_admin, only: [:index]

  end


end
