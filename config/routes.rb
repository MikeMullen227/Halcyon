Rails.application.routes.draw do
  	devise_for :users, :controllers => { :registrations => "admins" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 	get '/', to: 'site#home'

 	get '/admins/users', to: 'admins#list'

	resources :site

	resources :admins

	resources :tasks

	resources :jobs

	resources :employees

	resources :subcontractors
end