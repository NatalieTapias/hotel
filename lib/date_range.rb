require "date"

class DateRange
  attr_reader :start_date, :end_date
  
  # make date object in test 
  def initialize(start_date,end_date)
    @start_date = start_date
    @end_date = end_date
    
    # unless @start_date.instance_of?(Date) && @end_date.instance_of?(Date)
    #   raise ArgumentError.new("Hey that should be an instance of Date. start_date: #{start_date}, end_date: #{end_date}")
    # end
    
    if (@start_date >= @end_date) 
      raise ArgumentError.new("#{@start_date} needs to be before #{@end_date}.")
    end
    
  end
  
  def length_of_stay
    return (@end_date - @start_date).to_i
  end
  
  # (!) add in a date range 
  def contains_date?(date)
    return date >= @start_date && date <= @end_date
  end
  
  
end