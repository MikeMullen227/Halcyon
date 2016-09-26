class TasksController < ApplicationController
	def index
		@tasks = Task.all
		
	end

	def new
		@task = Task.new

	end

	def show
		@task = Task.find_by(id: params[:id])
	end
	

	def create
		task = Task.new(
			name: params[:task][:name],
			date: params[:task][:date],
			description: params[:task][:description],
			location: params[:task][:location],
			deadline: params[:task][:deadline]
			)
		if task.save
			redirect_to '/tasks'
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


		if task.save
			redirect_to '/tasks'
		else
			@task = task

			render :edit
		end
	end

	def destroy

   		task = Task.find(params[:id])
   	
   		task.destroy

    	redirect_to tasks_path
	end

end








			




