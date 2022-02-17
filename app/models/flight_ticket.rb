class FlightTicket < ApplicationRecord
  belongs_to :user
  belongs_to :departure, class_name: 'Airport'
  belongs_to :arrival, class_name: 'Airport'
  belongs_to :purchase
end
