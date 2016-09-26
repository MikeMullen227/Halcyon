class AdminsController < ApplicationController
	def index
		@users = User.all
	end

	def new 
		 @user = User.new
	end

	def create
		user = User.new(
			name: params[:user][:name],
			email: params[:user][:email],
			password: params[:user][:password]
		)

		if user.save
			redirect_to '/admins'
		else
			@user = user

			render :new
		end
	end

 	def edit
   		@user = User.find(params[:id])
 
    	render :edit
  	end

  	def update
		user = User.find(params[:id])
		user.name = params[:user][:name]
		user.email = params[:user][:email]
		user.password = params[:user][:password]

		if user.save
			redirect_to '/admins'
		else
			@user = user

			render :edit
		end
	end

	def destroy

   		user = User.find(params[:id])
   	
   		user.destroy

    	redirect_to admins_path
	end
end
