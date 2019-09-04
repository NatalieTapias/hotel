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
  
end