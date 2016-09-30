class EmployeesController < ApplicationController

	# before_filter :create_nav
	# def create_nav
	#   @nav_tabs =  { 
	#   	"My Info" => employee_path(current_user)
 #      }
	# end
	
	def show
		@jobs = current_user.jobs.as_json
		@tasks = current_user.tasks
		@employee = current_user
	end
		

end

