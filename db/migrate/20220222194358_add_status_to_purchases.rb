class AddStatusToPurchases < ActiveRecord::Migration[6.1]
  def change
    add_column :purchases, :status, :integer
  end
end
