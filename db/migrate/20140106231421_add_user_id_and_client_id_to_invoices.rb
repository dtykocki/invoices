class AddUserIdAndClientIdToInvoices < ActiveRecord::Migration
  def change
    add_reference :invoices, :user, index: true
    add_reference :invoices, :client, index: true
  end
end
