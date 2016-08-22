Rails.application.routes.draw do

  root 'static_pages#index'

  get '/signin', to: 'sessions#new'
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  post '/rides/new' => 'rides#new'
  
  resources :users
  resources :attractions
  resources :rides

end