class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.references :user, null: false, foreign_key: true
      t.references :flight_ticket, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
