class EmployeesController < ApplicationController

	# before_filter :create_nav
	# def create_nav
	#   @nav_tabs =  { 
	#   	"My Info" => employee_path(current_user)
 #      }
	# end
	
	def show
		@user = User.find(params[:id])
		@tasks = @user.tasks
		@employee = @user

		@jobs = {}

		@tasks.each do |task|
			if Job.exists?(task.job_id)
				job = Job.find(task.job_id)
				if @jobs.key?(task.job_id)
					@jobs[task.job_id][:tasks].push(task)
				else
					@jobs[task.job_id] = {
						:name => job.name,
						:tasks => [task]
					}
				end
			end
		end
	end
	
	def update
		# emp_log = EmployeeLog.find_by(employee_id: params[:id]).maximum("updated_at")
		# if emp_log.exists?
		# 	emp_log.log_out_time = time.now	
		# else
			emp_log = EmployeeLog.new(
				employee_id: params[:id],
				created_at: Time.now,
				updated_at: Time.now,
				log_out_time: Time.now
			)
		# end

		if emp_log.save
			render json: {"Saved" => true}
		else
			render json: {"Error" => "Save failed!"}
		end
	end

end



