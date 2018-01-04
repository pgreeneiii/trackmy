Rails.application.routes.draw do
  devise_for :users
  # Routes for the Calorie resource:

  root 'calories#dashboard'

  # CREATE
  get "/calories/new", :controller => "calories", :action => "new"
  post "/create_calorie", :controller => "calories", :action => "create"

  # READ
  get '/calories/dashboard', :controller => 'calories', :action => 'dashboard'
  get "/calories", :controller => "calories", :action => "index"
  get "/calories/:id", :controller => "calories", :action => "show"


  # UPDATE
  get "/calories/:id/edit", :controller => "calories", :action => "edit"
  post "/update_calorie/:id", :controller => "calories", :action => "update"

  # DELETE
  get "/delete_calorie/:id", :controller => "calories", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
