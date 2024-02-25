class AddRoomCountToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :room_count, :integer
  end
end
