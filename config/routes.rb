Rails.application.routes.draw do
  	devise_for :users, :controllers => { :registrations => "admins" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 	get '/', to: 'site#home'

	resources :site

	resources :admins

	

	resources :employees

	resources :subcontractors
end