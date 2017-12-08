Rails.application.routes.draw do

  namespace :admin do
    resources :cohorts
    resources :hidings
    resources :companies
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

  resources :companies, only: [:index, :show]
  resources :users, only: [:show, :index]
  resources :events, only: [:create]
  resources :positions
  resources :job_applications do
    get :autocomplete_company_name, :on => :collection
  end
  resources :offers
  resources :translations do 
    get :autocomplete_project_name, :on => :collection
  end

  get '/profile' => 'profiles#edit', as: "update_profile"
  resources :profiles, only: [:update]

  resources :entries, only: [:show]
  # get '/entries/:id' => 'entries#show', as: :entry

  get '/entries/:id/add_offer' => 'offers#add_new_to_existing_entry', as: :advance_job_application
  # probably makes sense to move this controller action to the entries controller at some point?

  get '/entries/:id/add_position' => 'positions#add_new_to_existing_entry', as: :advance_offer
  # probably makes sense to move this controller action to the entries controller at some point?

  get '/auth/:provider/callback' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  root 'dashboards#show'
end
