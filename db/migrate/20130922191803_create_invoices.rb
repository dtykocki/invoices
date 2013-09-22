class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :unique_id
      t.datetime :due_date
      t.decimal :amount, precision: 8, scale: 2
      t.string :status

      t.timestamps
    end
  end
end
