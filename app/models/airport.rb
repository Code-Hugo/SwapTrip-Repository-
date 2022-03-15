class Airport < ApplicationRecord
  #has_many :departing_flight_tickets, dependent: :destroy
  has_many :departing_flight_tickets, foreign_key: :departure_id, class_name: "FlightTicket"
  has_many :arriving_flight_tickets, foreign_key: :arrival_id, class_name: "FlightTicket"
  #has_one_attached :photo
end
