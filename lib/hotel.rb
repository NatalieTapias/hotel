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
  
  #list of reservations for a given date
  
  def list_of_reservations(date)
    reserved_rooms = []
    @rooms.each do |room|
      if room.reservation_exists?(date)
        reserved_rooms << room
      end
    end
    return reserved_rooms
  end
  
  # for now, returning this list of available rooms for a particular date has too many dependencies
  # I'll make a helper method in hotel class to take a look at reservations and return true/false if it is available
  # def available_room_list(one_date)
  #   available_rooms = []
  #   rooms.each do |room|
  #     room.reservation_list.
  #   end
  
  #   # return available_rooms
  # end
end