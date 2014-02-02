class Invoice < ActiveRecord::Base
  belongs_to :user
  belongs_to :client

  validates :amount, :status, :due_date, :client, presence: true
end
