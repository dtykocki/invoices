class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :unique_id, :due_date, :amount, :status, :client_id 
end
