# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
FlightTicket.destroy_all
User.destroy_all
puts "Database cleared"

puts "Seeding"
sleep 1
puts "Creating flight_ticket"


airports = []

airports << Airport.create!(
    code: "GZA",
    city: "Gaza"
)

airports << Airport.create!(
    code: "CAG",
    city: "Cagliari"
)
airports << Airport.create!(
    code: "BKF",
    city: "Katmai National Park"
)
airports << Airport.create!(
    code: "BGY",
    city: "Bergamo"
)
airports << Airport.create!(
    code: "ANU",
    city: "Antigua and Barbuda"
)
airports << Airport.create!(
    code: "AAL",
    city: "Aalborg"
)
airports << Airport.create!(
    code: "AAR",
    city: "Aarhus"
)
airports << Airport.create!(
    code: "ABA",
    city: "Abakan"
)
airports << Airport.create!(
    code: "ABI",
    city: "Abilene"
)
airports << Airport.create!(
    code: "ABQ",
    city: "Alburquerque"
)


# airports_codes = ["AAL", "AAR", "ABA", "ABI", "ABJ", "ABQ", "ANU", "BGY", "BKF", "CAC", "EBL", "FLL", "GUR", "GZA", "KHK", "LEX", "PSC", "SNF", "TSN"]

#airports_arrival = ["ZHR", "ZIA", "VCE", "SJC", "RKV", "RIX", "PHF", "ONT", "MXE", "MDL", "LGG", "JPA", "IDA", "HND", "MHO", "GVA", "GPS", "FOD"]

faker_time = Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 200, format: :long)

b = DateTime.parse faker_time
User.create!(email: "marc@yahoo.com", password: "123456")
10.times do 
    FlightTicket.create!(
    confirmation_id: [*('a'..'z'),*('0'..'9')].shuffle[0,6].join,
    ticket_number: rand(100000000..999999999),
    airline_code: ([*('A'..'Z')]).sample(3).join,
    flight_number: ([*('0'..'9')]).sample(4).join,
    price: rand(50..1000),
    departure_id: airports.sample.id,
    arrival_id: airports.sample.id,
    departure_at: faker_time,
    arrival_at: b + 8.hour,
    user_id: User.last.id
  )
end

puts "Seeded!"
