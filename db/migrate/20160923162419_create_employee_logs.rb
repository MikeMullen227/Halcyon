class CreateEmployeeLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_logs do |t|
      t.datetime :date
      t.integer :employee_id
      t.datetime :log_out_time

      t.timestamps
    end
  end
end
