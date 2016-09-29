class AdminsController < ApplicationController
	before_action :redirect_if_not_admin, only: [:show]
	def index
	
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
			redirect_to '/admins/users'
		else
			@user = user

			render :new
		end
	end

	def show
		@user = current_user
		@jobs = current_user.jobs
		# @tasks = []
		# @jobs.each do |job|
		#  job.tasks.each do |task|
		#  	@tasks.push(task)
	# 	 end
	# end



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
			redirect_to '/admins/users'
		else
			@user = user

			render :edit
		end
	end

	def destroy

   		user = User.find(params[:id])
   	
   		user.destroy

    	redirect_to '/admins/users'
	end
end
