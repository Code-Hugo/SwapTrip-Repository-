class RemoveConfirmationIdFromFlightTickets < ActiveRecord::Migration[6.1]
  def change
    remove_column :flight_tickets, :confirmation_id, :integer
  end
end
