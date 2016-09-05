Rails.application.routes.draw do

  namespace :admin do
    resources :cohorts
    resources :entries
    resources :job_applications
    resources :offers
    resources :permissions
    resources :positions
    resources :profiles
    resources :salaries
    resources :schools
    resources :users

    root to: "users#index"
  end

  resources :events, only: [:create]
  resources :positions
  resources :job_applications
  resources :offers

  get '/profile' => 'profiles#edit', as: "update_profile"
  resources :profiles, only: [:update]

  get '/entries/:id' => 'entries#show', as: :entry

  get '/entries/:id/add_offer' => 'offers#add_new_to_existing_entry', as: :advance_job_application
  # probably makes sense to move this controller action to the entries controller at some point?

  get '/entries/:id/add_position' => 'positions#add_new_to_existing_entry', as: :advance_offer
  # probably makes sense to move this controller action to the entries controller at some point?

  get '/auth/:provider/callback' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  post '/new_entry' => 'application#new_entry_prompt', as: :new_entry_prompt

  root 'application#dashboard'
  # url currently displays incorrectly
end
