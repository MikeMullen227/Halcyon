class TasksController < ApplicationController
	def index
		@tasks = Task.all
		render json: tasks
	end

	def create
		@task = Task.create(task_params)
		render json: tasks
	end

	def new
		
	end

	def show
		@task = Task.find_by(id: params[:id])
	end


end


class SandwichesController < ApplicationController
	def index
		sandwiches = Sandwich.all 
		render json: sandwiches
	end

	def create 
		sandwich = Sandwich.create(sandwich_params)
		render json: sandwich
	end

	def show 
		sandwich = Sandwich.find_by(id: params[:id])

		# sandwich.ingredients.each do |ingredient|
		# 	sandwich.total_calories += ingredient.calories
		# end
		
		# sandwich_with_ingredients = sandwich.ingredients.all
		unless sandwich 
			render json: {error: "sandwich not found"},
			status: 404
			return
		end

		 render :json => sandwich.to_json(:include => [:ingredients])

		
		# render json: sandwich_with_ingredients
	end

