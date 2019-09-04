require_relative "room"
require_relative "date_range"


class Reservation
  attr_reader :id, :room, :date_range
  
  def initialize(id, room, date_range)
    @id = id
    @room = room
    @date_range = date_range
  end
  
  def validate_id(id)
    if id.nil? || id <= 0
      raise ArgumentError.new("The reservation ID must be non nil and greater than 0")
    end
  end
end