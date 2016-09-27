class SiteController < ApplicationController
	def show
		if user_signed_in?
			redirect_to '/admins'
		else
		render 'home'
		
	end
	end
end