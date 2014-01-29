class Invoice < ActiveRecord::Base
  belongs_to :user
  belongs_to :client

  validates :due_date, presence: true
end
