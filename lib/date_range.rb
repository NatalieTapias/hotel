require "date"

class DateRange
  attr_reader :start_date, :end_date
  
  def initialize(start_date,end_date)
    @start_date = Date.parse(start_date) 
    @end_date = Date.parse(end_date)
    
    # 0 means that @start_date is equal to @end_date
    if (@start_date <=> @end_date) == 0 
      raise InvalidDateRangeError.new("#{@start_date} is the same date as #{@end_date}. Please provide a start date that is before the end date.")
    end
    
    # 1 means that @start_date is greater than (after) @end_date
    if (@start_date <=> @end_date) == 1
      raise InvalidDateRangeError.new("#{@start_date} is after #{@end_date}. Please provide a start date that is before the end date.")
    end
  end
  
  def length_of_stay
    return @end_date - @start_date 
  end
  
  
end

class InvalidDateRangeError < StandardError
end