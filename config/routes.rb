Rails.application.routes.draw do

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

  resources :profiles

  resources :entries
  resources :job_applications
  resources :offers

  get '/auth/:provider/callback' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  root 'application#dashboard'
  # url currently displays incorrectly
end
