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
  
  # I'm going to need to run the test (is there overlap?)
  def make_reservation(proposed_date_range)
    # if reservation doesn't already exist, do this, make a reservation
    @reservation_list.push(proposed_date_range) 
  end
  
  def reservation_exists?(date)
    @reservation_list.each do |reservation|
      return reservation.contains_date?(date)
    end
  end
  
  def total_cost(date_range)
    return @cost * date_range.length_of_stay
  end
  
  
end
