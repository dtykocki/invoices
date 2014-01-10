class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :company_name, :address_line_1, :address_line_2, :city, :state, :zip_code
end
