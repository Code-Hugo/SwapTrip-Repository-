class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :flight_ticket
  enum status: { pending: 0, sold: 1, cancelled: -1 }
end
