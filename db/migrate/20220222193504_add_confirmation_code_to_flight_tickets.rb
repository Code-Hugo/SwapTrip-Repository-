class AddConfirmationCodeToFlightTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :flight_tickets, :confirmation_code, :string
  end
end
