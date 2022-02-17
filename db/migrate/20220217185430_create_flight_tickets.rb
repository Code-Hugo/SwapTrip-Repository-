class CreateFlightTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :flight_tickets do |t|
      t.integer :confirmation_id
      t.integer :ticket_number
      t.integer :flight_number
      t.integer :price
      t.datetime :departure_at
      t.datetime :arrival_at
      t.references :departure, null: false, foreign_key: { to_table: :airports }
      t.references :arrival, null: false, foreign_key: { to_table: :airports }
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
