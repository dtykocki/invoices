class Client < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true

  has_many :invoices
  belongs_to :user
end
