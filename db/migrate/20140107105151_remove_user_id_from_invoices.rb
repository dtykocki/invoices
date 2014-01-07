class RemoveUserIdFromInvoices < ActiveRecord::Migration
  def change
    remove_column :invoices, :user_id
  end
end
