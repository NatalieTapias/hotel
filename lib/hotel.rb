require_relative "room"
require_relative "date_range"

class Hotel
  attr_reader :rooms
  
  def initialize
    @rooms = []
    20.times do |i|
      @rooms << Room.new(i + 1)
    end
  end
  
  
  
  def make_reservation(date_range)
    i = 0
    room = @rooms[i]
    while room.reservation_exists?(date_range)
      i += 1
      room = @rooms[i]
    end
    room.make_reservation(date_range)
  end
  
  
  
  def list_of_reservations(date_range)
    reserved_rooms = []
    @rooms.each do |room|
      if room.reservation_exists?(date_range)
        reserved_rooms << room
      end
    end
    return reserved_rooms
  end
  
  
  
  def list_of_available_rooms(date_range)
    unavailable_rooms = self.list_of_reservations(date_range)
    available_rooms = @rooms
    unavailable_rooms.each do |room| 
      available_rooms.delete(room)
    end
    return available_rooms
  end
end
#   unavailable_rooms = []
#   @rooms.each do |room|
#     (room.reservation_list).each do |existing_reservation_date_range|
#       if !(date_range_overlaps?(date_range,date_range))
#         unavailable_rooms << room
#       end
#     end
#   end
#   # rooms = @rooms
#   # available_rooms = unavailable_rooms.map{|room| rooms.pop(room) }
#   return unavailable_rooms
# end