class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :unique_id, :due_date, :amount, :status, :client_id, :created_at, :updated_at 

  def due_date
    object.due_date.to_time.to_i
  end
end
