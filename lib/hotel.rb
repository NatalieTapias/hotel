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
  
  def make_reservation(start_date, end_date)
    date_range = DateRange.new(start_date, end_date)
    room = @rooms.sample
    reservation = Reservation.new(room, date_range)
    @reservations << reservation
  end
  
  # I can access the list of reservations for a specific date, so that I can track reservations by date
  def reservations_list(date)
    reservations_list = []
    @reservations.each do |reservation|
      if reservation.date_range.contains_date?(date)
        reservations_list << reservation
      end
    end
    return reservations_list
  end
end
