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
  
  # accept DateRange object rather than start and end date
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
  
  # I can view a list of rooms that are not reserved for a given date range, so that I can see all available rooms for that day
  def available_room_list(start_date, end_date)
    unavailable_rooms = []
    reservations = reservations_list(start_date)
    reservations.each do |reservation|
      unavailable_rooms.push(reservation.room)
    end
    
    
    unavailable_rooms.each do |room|
      rooms.delete(room)
    end
    return rooms
  end
  # I can get a reservation of a room for a given date range, and that room will not be part of any other reservation overlapping that date range
  # I want an exception raised if I try to reserve a room during a date range when all rooms are reserved, 
  # so that I cannot make two reservations for the same room that overlap by date
  
end
