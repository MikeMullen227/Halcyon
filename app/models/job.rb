class Job < ApplicationRecord
	has_many :tasks
	has_many :user_jobs 
	has_many :users, through: "user_jobs"
end
	