class SiteController < ApplicationController
	def show

		@current_user = current_user.id
		render 'home'
	end
end