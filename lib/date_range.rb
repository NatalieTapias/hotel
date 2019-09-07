require "date"

class DateRange
  attr_reader :start_date, :end_date
  
  # make date object in test 
  def initialize(start_date,end_date)
    @start_date = start_date
    @end_date = end_date
    
    if (@start_date >= @end_date) 
      raise ArgumentError.new("start_date #{@start_date} needs to be before end_date#{@end_date}.")
    end
  end
  
  def length_of_stay
    return (@end_date - @start_date).to_i
  end
  
  # (!) add in a date range 
  def contains_date?(date)
    return date >= @start_date && date <= @end_date
  end
  
  # also this needs a test  i'm not sure if this goes here or not 
  def date_range_overlaps?(date_range)
    # true = there is overlap
    # false = there is no overlap (it's good! make a self!)
    if self.start_date <= date_range.end_date && self.end_date <= date_range.end_date
      return true
    elsif date_range.start_date <= self.start_date && date_range.end_date >= self.end_date
      return true
    elsif date_range.start_date <= self.start_date && date_range.end_date >= self.end_date
      return true
    elsif date_range.start_date <= self.start_date && date_range.end_date >= self.end_date
      return true
    elsif self.start_date == date_range.end_date || self.end_date == date_range.start_date
      return false
    else 
      return false
    end
  end
  
  
end