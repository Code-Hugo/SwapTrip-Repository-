class FlightTicket < ApplicationRecord
  belongs_to :user
  belongs_to :departure, class_name: 'Airport'
  belongs_to :arrival, class_name: 'Airport'
  has_many :purchase
  validates :airline_code, presence: true
  validates :ticket_number, presence: true, numericality: { only_integer: true }, length: { is:13 } 
  validates :departure_at, presence: true
end
