require_relative "date_range"


class Room
  attr_reader :id, :rate, :reservation_list
  
  def initialize(id)
    incorrect_id?(id)
    @id = id
    @rate = 200.00
    @reservation_list = []
  end
  
  # this may be unnecessary?
  def incorrect_id?(given_id)
    if given_id.class != Integer
      raise ArgumentError.new("#{given_id} is not an Integer")
    elsif given_id > 20 || given_id < 1
      raise ArgumentError.new("#{given_id} is out of range. It needs to be between 1-12.")
    end
  end 
  
  def total_cost(date_range)
    return @rate * date_range.length_of_stay
  end
  
  # I'm going to need to run the test (is there overlap?)
  def make_reservation(date_range)
    self.reservation_list.each do |reservation|
      if reservation.date_range_overlaps?(date_range)
        raise StandardError.new("You can't reserve room ##{self.id} for the dates #{date_range.start_date} through #{date_range.end_date}. Please ")
      end
    end
  else
    @reservation_list.push(date_range) 
  end
  
  
  def reservation_exists?(date)
    @reservation_list.each do |reservation|
      return reservation.contains_date?(date)
    end
  end
  
  
  
  
end
