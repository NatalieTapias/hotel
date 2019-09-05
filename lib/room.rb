require_relative "date_range"


class Room
  attr_reader :id, :cost, :reservation_list
  
  def initialize(id)
    incorrect_id?(id)
    @id = id
    @cost = 200.00
    @reservation_list = []
  end
  
  def incorrect_id?(given_id)
    if given_id.class != Integer
      raise ArgumentError.new("#{given_id} is not an Integer")
    elsif given_id > 20 || given_id < 1
      raise ArgumentError.new("#{given_id} is out of range. It needs to be between 1-12.")
    end
  end 
  
  def make_reservation(date_range)
    @reservation_list << date_range
  end
  
end
