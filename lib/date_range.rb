require "date"

class DateRange
  attr_reader :start_date, :end_date
  
  def initialize(start_date,end_date)
    @start_date = Date.parse(start_date) 
    @end_date = Date.parse(end_date)
    
    # evaluates to 0 if @start_date is equal to @end_date
    if (@start_date <=> @end_date) == 0 
      raise ArgumentError.new("#{@start_date} is the same date as #{@end_date}. Please provide a start date that is before the end date.")
    end
    
    # evaluates to 1 if @start_date is after @end_date
    if (@start_date <=> @end_date) == 1
      raise ArgumentError.new("#{@start_date} is after #{@end_date}. Please provide a start date that is before the end date.")
    end
  end
  
  def length_of_stay
    return (@end_date - @start_date).to_i
  end
  
  # (!) add in a date range 
  def contains_date?(date)
    parsed_date = Date.parse(date)
    return parsed_date >= @start_date && parsed_date <= @end_date
  end
  
  def self.date_range_array
  end
  
end