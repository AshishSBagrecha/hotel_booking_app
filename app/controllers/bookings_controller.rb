# app/controllers/bookings_controller.rb
class BookingsController < ApplicationController
  def create
    booking_params = JSON.parse(request.body.read)
    bookings = []
  
    # Check if the 'bookings.json' file already exists
    if File.exist?('bookings.json')
      # Read existing bookings from the file
      bookings = JSON.parse(File.read('bookings.json'))
    end
  
    # Calculate the new ID for the booking
    new_id = bookings.empty? ? 1 : bookings.last['id'] + 1
  
    # Append the new booking with the calculated ID to the array
    new_booking = booking_params.merge('id' => new_id)
    bookings << new_booking
  
    # Write the updated array of bookings back to the file
    File.open('bookings.json', 'w') do |file|
      file.puts(bookings.to_json)
    end
  
    head :created
  rescue JSON::ParserError => e
    render json: { error: 'Invalid JSON' }, status: :bad_request
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end
  

  def index
    Rails.logger.info "============="
    bookings = File.read('bookings.json')
    Rails.logger.info "============="
    Rails.logger.info bookings
    render json: bookings.to_json
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  def destroy
    booking_id = params[:id].to_i
    
    # Read the existing bookings from the 'bookings.json' file
    bookings = []
    if File.exist?('bookings.json')
      bookings = JSON.parse(File.read('bookings.json'))
    end
    
    # Find the index of the booking to be deleted
    index_to_delete = nil
    bookings.each_with_index do |booking, index|
      if booking['id'] == booking_id
        index_to_delete = index
        break
      end
    end
    
    if index_to_delete
      # Remove the booking from the array
      bookings.delete_at(index_to_delete)
      
      # Write the updated array of bookings back to the file
      File.open('bookings.json', 'w') do |file|
        file.puts(bookings.to_json)
      end
      
      head :no_content
    else
      render json: { error: 'Booking not found' }, status: :not_found
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end
  
end