class Airport < ApplicationRecord
  has_many :flight_tickets, dependent: :destroy
end
