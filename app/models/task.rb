class Task < ApplicationRecord
	has_many :user_tasks
	has_many :users, through: "user_tasks"
	belongs_to :job

	after_initialize :wat

	def wat
		puts self.name
		puts self.deadline
	end
end



