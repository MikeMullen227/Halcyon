class UsersController < ApplicationController
	def show
		@user = User.find(params[])
		render 'show'
	end
end
