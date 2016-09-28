class SiteController < ApplicationController
	

	def show
		if current_user 
		if current_user.role == "admin"
			redirect_to '/admins'
		else
		render 'home'
		end
		end
	end
end
