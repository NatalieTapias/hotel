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
  
end
