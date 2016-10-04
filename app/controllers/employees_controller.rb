class EmployeesController < ApplicationController

	# before_filter :create_nav
	# def create_nav
	#   @nav_tabs =  { 
	#   	"My Info" => employee_path(current_user)
 #      }
	# end
	
	def show
		@user = User.find(params[:id])
		@jobs = @user.jobs.as_json
		@tasks = @user.tasks
		@employee = @user

	end
		

end

