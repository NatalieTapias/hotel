require_relative "room"
require_relative "date_range"

class Hotel
  attr_reader :rooms
  
  def initialize
    @rooms = []
    20.times do |i|
      rooms << Room.new(i + 1)
    end
  end
  
  # def available_room_list(start_date, end_date)
  #   unavailable_rooms = []
  #   early_reservations = reservations_list(start_date)
  #   early_reservations.each do |a_reservation|
  #     unavailable_rooms.push(a_reservation.room)
  #   end
  #   # the goal here is to grab a list of reservations for the end date
  #   late_reservations = reservations_list(end_date)
  #   late_reservations.each do |a_reservation|
  #     unavailable_rooms.push(a_reservation.room)
  #   end
  
  #   unavailable_rooms.each do |room|
  #     rooms.delete(room)
  #   end
  #   return rooms
  # end
  # I can get a reservation of a room for a given date range, and that room will not be part of any other reservation overlapping that date range
  # I want an exception raised if I try to reserve a room during a date range when all rooms are reserved, 
  # so that I cannot make two reservations for the same room that overlap by date
  
end
