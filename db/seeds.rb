# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Purchase.destroy_all
FlightTicket.destroy_all
User.destroy_all
Airport.destroy_all
puts "Database cleared"

puts "Seeding"
sleep 1
puts "Creating flight_ticket"

airports = []
airportsarrival = []

airportsarrival << Airport.create!(
    code: "GZA",
    city: "Gaza",
    photo: 'Gaza.jpg'
)
airports << Airport.create!(
  code: "CAG",
  city: "Cagliari",
  photo: 'Cagliari.jpg'
)
airports << Airport.create!(
  code: "BKF",
  city: "Katmai National Park",
  photo: 'Katmai.jpg'
)

airportsarrival << Airport.create!(
    code: "BGY",
    city: "Bergamo",
    photo: 'Bergamo.jpg'
)
airportsarrival << Airport.create!(
    code: "ANU",
    city: "Antigua and Barbuda",
    photo: 'Antigua.jpg'
)

airports << Airport.create!(
  code: "AAL",
  city: "Aalborg",
  photo: 'aalborg.jpg'
)

airportsarrival << Airport.create!(
    code: "AAR",
    city: "Aarhus",
    photo: 'aarhus.jpg'
)

airports << Airport.create!(
  code: "DWC",
  city: "Dubai",
  photo: 'Dubai.jpg'
)

airportsarrival << Airport.create!(
    code: "HER",
    city: "Crete",
    photo: 'Crete.jpg'
)

airports << Airport.create!(
  code: "KHH",
  city: "Kaohsiung",
  photo: 'Kaohsiung.jpg'
)

airports << Airport.create!(
    code: "BCN",
    city: "Barcelona",
    photo: 'Barcelona.jpg'
)

airports << Airport.create!(
    code: "TXL",
    city: "Berlin",
    photo: 'Berlin.jpg'
)

airports << Airport.create!(
    code: "LHR",
    city: "London Heathrow Airport",
    photo: 'London.jpg'
)

airports << Airport.create!(
    code: "VIE",
    city: "Vienna",
    photo: 'Vienna.jpg'
)

airports << Airport.create!(
    code: "GIG",
    city: "Rio de Janeiro",
    photo: 'Rio.jpg'
)

airportsarrival << Airport.create!(
    code: "PKX",
    city: "Beijing Daxing",
    photo: 'Beijing.jpg'
)

airports << Airport.create!(
    code: "CAI",
    city: "Cairo",
    photo: 'Cairo.jpg'
)

airports << Airport.create!(
    code: "SYD",
    city: "Sydney",
    photo: 'Sydney.jpg'
)

airportsarrival << Airport.create!(
    code: "BLQ",
    city: "Bologna",
    photo: 'Bologna.jpg'
)

airportsarrival << Airport.create!(
    code: "IST",
    city: "Istanbul",
    photo: 'Istanbul.jpg'
)

faker_time = Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 200, format: :long)
b = DateTime.parse faker_time
User.create!(email: "marc@yahoo.com", password: "123456")
User.create!(email: "tobi@gmail.com", password: "123456", Fullname: "Tobiasz Golian", username: "Tobgol", address: "Barcelona")
User.create!(email: "hugo@yahoo.com", password: "123456")

new_flight = []
50.times do
  new_flight << FlightTicket.new(

  confirmation_code: [*('a'..'z'),*('0'..'9')].shuffle[0,6].join,
  ticket_number: rand(1000000000000..9999999999999),
  airline_code: ([*('A'..'Z')]).sample(3).join,
  flight_number: ([*('A'..'Z')]).sample(2).join + ([*('0'..'9')]).sample(3).join,
  price: rand(50..1000),
  departure_id: airports.sample.id,
  departure_at: faker_time,
  arrival_id: airportsarrival.sample.id,
  arrival_at: b + 8.hour,
  user_id: User.last.id
 )
end

new_flight.each do |flight_ticket|
  flight_ticket.arrival_id = airports.reject { |airport| airport.id == flight_ticket.departure_id }.sample.id
  flight_ticket.save!
end
puts "#{FlightTicket.count} tickets are created!"
puts "Seeded!"
