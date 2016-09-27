class JobsController < ApplicationController
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
	end
	
	def create
		job = Job.new(
			name: params[:job][:name],
			date: params[:job][:date],
			description: params[:job][:description],
			location: params[:job][:location],
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

			redirect_to '/jobs'
		else
			@job = job

			render :new
		end
	end

	def edit
   		@job = Job.find(params[:id])
 
    	render :edit
  	end

  	def update
	job = Job.find(params[:id])
		job.name = params[:job][:name]
		job.date = params[:job][:date]
		job.description = params[:job][:description]
		job.location = params[:job][:location]
		
		if job.save
			redirect_to '/jobs'
		else
			@job = job

			render :edit
		end
	end

	def destroy
		job = Job.find(params[:id])
   		job.destroy
		redirect_to jobs_path
	end

end


