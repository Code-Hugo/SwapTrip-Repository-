class AddAirlineCodeToFlightTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :flight_tickets, :airline_code, :string
  end
end
