class BookingsController < ApplicationController
  IN_MEMORY_BOOKINGS = []
  def new
    @booking = Booking.new
  end

  def index
    p "=====IN_MEMORY_BOOKINGS======"
    p IN_MEMORY_BOOKINGS
    @bookings = Booking.all + IN_MEMORY_BOOKINGS
  end

  def create
    @booking = Booking.new(booking_params)
    # Find the room based on params and associate it with the booking
    room = Room.find_by(hotel_id: params[:hotel_id])
    @booking.room = room
  
    if @booking.save
      # Handle successful creation
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      # Handle errors
      render :new
    end
  end
  

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully canceled.'
  end

  def edit
    @booking = Booking.find(params[:id])
    p params
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    p "=====params=============="
    p params
    params.require(:booking).permit(:check_in, :check_out, :hotel_id, :room_count)
  end
end
