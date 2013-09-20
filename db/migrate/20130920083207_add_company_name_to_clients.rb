class AddCompanyNameToClients < ActiveRecord::Migration
  def change
    add_column :clients, :company_name, :string
  end
end
