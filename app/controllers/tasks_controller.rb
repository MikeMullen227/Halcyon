	class TasksController < ApplicationController
		before_action :redirect_if_not_admin 
		before_action :create_nav




	def create_nav
	  @nav_tabs =  { 
	  	'Manage' => '/admins'
      }
	end
	
	def index
		@tasks = Task.all
		
	end

	def new
		@task = Task.new
		@job_id = params[:job_id]
		@users = User.all
		@user_array = []
		@users.each do |user|
			@user_array.push(user.name)
		end

	end

	def show
		@task = Task.find_by(id: params[:id])
		@task_users = @task.users
	end
	

	def create
		job_id = params[:task][:job_id]
		task = Task.new(
			name: params[:task][:name],
			date: params[:task][:date],
			description: params[:task][:description],
			location: params[:task][:location],
			deadline: params[:task][:deadline],
			# user: params[:task][:user],
			job_id: job_id
			)


		if task.save
			
			params[:task][:users].each do |user|
				#users.push(User.find_by(:name user))
				if user != ''
					task.users << User.find_by(name: user)
				end
			end	
			task.save

			redirect_to '/jobs/' + job_id

		else
			@task = task

			render :new
		end
	end

	def edit
   		@task = Task.find(params[:id])

   		
 
    	render :edit
  	end

  	def update
	task = Task.find(params[:id])
		task.name = params[:task][:name]
		task.date = params[:task][:date]
		task.description = params[:task][:description]
		task.location = params[:task][:location]
		task.deadline = params[:task][:deadline]

		job_id = task.job.id

		if task.save
			redirect_to job_path(job_id)
		else
			@task = task

			render :edit
		end
	end

	def destroy

   		task = Task.find(params[:id])
   	
   		task.destroy
   		job_id = task.job.id
   		redirect_to job_path(job_id)
    	
	end

end








			




