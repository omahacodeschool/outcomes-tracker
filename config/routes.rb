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

  get '/profile' => 'profiles#edit', as: "update_profile"

  resources :salaries
  resources :positions
# RAILS RESOURCE ROUTING
# GET     /photos            photos#index    photos_path
# GET     /photos/new        photos#new      new_photo_path
# POST    /photos            photos#create   photos_path
# GET     /photos/:id        photos#show     photo_path(:id)
# GET     /photos/:id/edit   photos#edit     edit_photo_path(:id)
# PATCH   /photos/:id        photos#update   photo_path(:id)
# DELETE  /photos/:id        photos#destroy  photo_path(:id)

  resources :users
  # GET /users/:id        users#show
  # GET /users/:id/edit   users#edit
  # PATCH /users/:id      users#update

  resources :cohorts
  resources :schools

  resources :profiles, only: [:update]

  # MIGHT DELETE THIS ROUTING ALL TOGETHER?
  # resources :entries
  get '/entries/:id' => 'entries#show', as: :entry
  # get '/entries/new/job_application' => 'entries#new_job_application'
  # get '/entries/new/offer' => 'entries#new_offer'
  # get '/entries/new/position' => 'entries#new_position'

  get '/entries/:id/add_offer' => 'offers#add_new_to_existing_entry', as: :advance_job_application
  # probably makes sense to move this controller action to the entries controller at some point?

  get '/entries/:id/add_position' => 'positions#add_new_to_existing_entry', as: :advance_offer
  # probably makes sense to move this controller action to the entries controller at some point?

  resources :job_applications
  resources :offers

  get '/auth/:provider/callback' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  post '/new_entry' => 'application#new_entry_prompt', as: :new_entry_prompt

  root 'application#dashboard'
  # url currently displays incorrectly
end
