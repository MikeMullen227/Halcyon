class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.string :project_name
      t.string :subcontractor_name
      t.integer :invoice_number
      t.string :invoice_amount

      t.timestamps
    end
  end
end
