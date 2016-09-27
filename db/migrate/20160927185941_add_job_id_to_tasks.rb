class AddJobIdToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :job_id, :integer
  end
end
