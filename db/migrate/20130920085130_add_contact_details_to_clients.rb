class AddContactDetailsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :address_line_1, :string, limit: 255
    add_column :clients, :address_line_2, :string, limit: 255
    add_column :clients, :city, :string, limit: 255
    add_column :clients, :state, :string, limit: 2
    add_column :clients, :zip_code, :string, limit: 5
  end
end
