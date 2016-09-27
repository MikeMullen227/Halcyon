class TasksController < ApplicationController
	def index
		@tasks = Task.all
		
	end

	def new
		@task = Task.new
		@job_id = params[:job_id]

	end

	def show
		@task = Task.find_by(id: params[:id])
	end
	

	def create
		job_id = params[:task][:job_id]
		task = Task.new(
			name: params[:task][:name],
			date: params[:task][:date],
			description: params[:task][:description],
			location: params[:task][:location],
			deadline: params[:task][:deadline],
			job_id: job_id
			)
		if task.save
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








			




