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
  
  def date_range_overlaps?(date_range)
    # true = there is overlap
    # false = there is no overlap (it's good!)
    if self.start_date == date_range.end_date || self.end_date == date_range.start_date
      return false
    elsif self.start_date >= date_range.start_date && date_range.end_date > self.start_date
      return true
    elsif self.start_date <= date_range.start_date && date_range.start_date < self.end_date
      return true
    else
      return false
    end
  end
end


