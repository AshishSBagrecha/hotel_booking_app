class AddNumRoomsToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :num_rooms, :integer
  end
end
