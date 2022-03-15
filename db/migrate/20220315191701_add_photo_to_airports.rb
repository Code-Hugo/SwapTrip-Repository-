class AddPhotoToAirports < ActiveRecord::Migration[6.1]
  def change
    add_column :airports, :photo, :string
  end
end
