require_relative "room"
require_relative "date_range"


class Reservation
  attr_reader :room, :date_range
  
  def initialize(room, date_range)
    @room = room
    @date_range = date_range
  end
  
  def cost
    return @date_range.length_of_stay * @room.cost
  end
  
  def length_of_stay
    return @date_range.length_of_stay
  end
  
end