require_relative "reservation"
require_relative "room"
require_relative "date_range"

class Hotel
  
  attr_reader :reservations, :rooms
  
  def initialize
    @reservations = []
    @rooms = []
    20.times do |i|
      rooms << Room.new(i + 1)
    end
  end
  
  
  # make a reservation 
  # test for date range
  def make_reservation(start_date, end_date)
    date_range = DateRange.new(start_date, end_date)
    room = @rooms.sample
    reservation = Reservation.new(room, date_range)
    @reservations << reservation
    
  end
  
end