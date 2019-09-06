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
  def make_reservation(date_range)
    @reservation_list.push(date_range) 
  end
  
  # do I want this here or in hotel??
  def date_range_overlaps?(existing_date_range, proposed_date_range)
    # when date ranges intersect
    if existing_date_range.start_date <= proposed_date_range.start_date && existing_date_range.end_date >= proposed_date_range.end_date
      return false
      # when date ranges are not intersecting, and occur either before or after existing date range
    elsif existing_date_range.start_date > proposed_date_range.end_date || existing_date_range.end_date < proposed_date_range.start_date
      return true
      #  (you can check in to a room when another person checks out of it and vice-versa)
    elsif existing_date_range.start_date == proposed_date_range.end_date || existing_date_range.end_date == proposed_date_range.start_date
      return true
    end
  end
end

# # this is a method to test if a room is available on a particular date
# def room_available_on_date?(particular_date)
#   @reservation_list.each do |reservation|
#     if reservation.contains_date?(particular_date)
#       return room
#     end
#   end
# end
