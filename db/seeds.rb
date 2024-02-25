# db/seeds.rb

# Seed data for Hotels
hotels = [
  { name: 'Hotel A', location: 'City A' },
  { name: 'Hotel B', location: 'City B' },
  { name: 'Hotel C', location: 'City C' }
]

# Seed data for Rooms
rooms = [
  { number: 101, hotel_id: 1 },
  { number: 102, hotel_id: 1 },
  { number: 201, hotel_id: 2 },
  { number: 202, hotel_id: 2 },
  { number: 301, hotel_id: 3 },
  { number: 302, hotel_id: 3 }
]

# Seed data for Users
users = [
  { name: 'John Doe', email: 'john@example.com'},
  { name: 'Jane Smith', email: 'jane@example.com', }
]

# Seed data for Bookings
bookings = [
  { check_in: Date.today, check_out: Date.today + 3, user_id: 1, room_id: 1, hotel_id: 1 },
  { check_in: Date.today + 1, check_out: Date.today + 4, user_id: 2, room_id: 2, hotel_id: 1 },
  { check_in: Date.today + 2, check_out: Date.today + 5, user_id: 1, room_id: 3, hotel_id: 1 },
  # Add more bookings as needed
]

# Create hotels
hotels.each { |h| Hotel.create!(h) }

# Create rooms
rooms.each { |r| Room.create!(r) }

# Create users
users.each { |u| User.create!(u) }

# Create bookings
bookings.each { |b| Booking.create!(b) }
