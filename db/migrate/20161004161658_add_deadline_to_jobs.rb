class AddDeadlineToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :deadline, :datetime
  end
end
