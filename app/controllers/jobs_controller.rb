class JobsController < ApplicationController
	before_action :redirect_if_not_admin 

	# before_filter :create_nav
	# def create_nav
	#   @nav_tabs =  { 
	#   	'Manage' => '/admins'
 #      }
	# end
	
	def index
		@jobs = Job.all
	end

	def new
		@job = Job.new
		@users = User.all
		@user_array = []
		@users.each do |user|
			@user_array.push(user.name)
		end
	end

	def show
		@job = Job.find_by(id: params[:id])
		@tasks = @job.tasks
		

	end
	
	def create
		job = Job.new(
			name: params[:job][:name],
			date: params[:job][:date],
			description: params[:job][:description],
			location: params[:job][:location],
			deadline: params[:job][:deadline]
			)

		if job.save
			#users = []
			params[:job][:users].each do |user|
				#users.push(User.find_by(:name user))
				if user != ''
					job.users << User.find_by(name: user)
				end
			end	
			job.save

			redirect_to '/admins'
		else
			@job = job

			render :new
		end
	end

	def edit
   		@job = Job.find(params[:id])
 		@users = User.all
		@user_array = []
		@users.each do |user|
			@user_array.push(user.name)
    	
    	# redirect_to '/jobs'
    	end
    	render :edit
  	end

  	def update
	job = Job.find(params[:id])
		job.name = params[:job][:name]
		job.date = params[:job][:date]
		job.description = params[:job][:description]
		job.location = params[:job][:location]
		job.deadline = params[:job][:deadline]
		
		if job.save
			# code below prevents duplicate names after updating
			params[:job][:users].each do |name|
				if name != ""
					user = User.find_by(name: name)

					if !job.users.include? user
						job.users << user
					end
				end
			end	
			redirect_to job_path(job.id)
		else
			@job = job

			render :edit
		end
	end

	def destroy
		job = Job.find(params[:id])
   		job.destroy
		redirect_to '/admins'
	end

end


