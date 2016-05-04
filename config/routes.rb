Rails.application.routes.draw do
  resources :users

  get '/auth/:provider/callback' => 'sessions#create'

  root 'users#index'
end
