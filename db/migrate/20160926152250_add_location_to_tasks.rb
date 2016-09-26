class AddLocationToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :location, :string
  end
end
