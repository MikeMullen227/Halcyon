class AdminsController < ApplicationController
	before_action :redirect_if_not_admin

	# before_filter :create_nav
	# def create_nav
	#   @nav_tabs =  { 
	#   	'Manage' => '/admins'
 #      }
	# end

	def index
		@users = User.all
		@jobs = Job.all
	end

	def list
		@users = User.all
	end

	def new 
		 @user = User.new
	end

	def create
		user = User.new(
			name: params[:user][:name],
			email: params[:user][:email],
			password: params[:user][:password],
			password_confirmation: params[:user][:password_confirmation],
			role: params[:user][:role]
		)

		if user.save
			redirect_to '/admins'
		else
			@user = user
			render :new
		end
	end

	def show
		if current_user.role == "admin"
			@user = User.find(params[:id])
			@jobs = @user.jobs
			
		else 
		@user = current_user
		@jobs = current_user.jobs

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
		user.password_confirmation = params[:user][:password_confirmation]
		user.role = params[:user][:role]

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
    	redirect_to '/admins'
	end
end
		

   	


 





