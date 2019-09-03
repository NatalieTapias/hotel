class DateRange
  attr_reader :start_date, :end_date
  
  def initialize(start_date,end_date)
    @start = start_date
    @end = end_date
  end
  
end