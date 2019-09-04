require_relative "room"
require_relative "date_range"


class Reservation
  attr_reader :id
  
  def initialize(id, room, date)
    @id = id
    @room = room
    @date = date
  end
  
  def validate_id(id)
    if id.nil? || id <= 0
      raise ArgumentError.new("The reservation ID must be non nil and greater than 0")
    end
  end
end