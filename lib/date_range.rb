require "date"


class DateRange
  attr_reader :start_date, :end_date
  
  def initialize(start_date,end_date)
    
    
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
  end
  
  def is_date?(start_date,end_date)
    unless start_date.class Date
      raise ArgumentError.new"It is not class Date. It is #{time}."
    end
    unless end_date.class Date
      raise ArgumentError.new"It is not class Date. It is #{time}."
    end
  end
  
end


# d = Date.parse('3rd Feb 2001')
#                              #=> #<Date: 2001-02-03 ...>
# d.year                       #=> 2001
# d.mon                        #=> 2
# d.mday                       #=> 3
# d.wday                       #=> 6
# d += 1                       #=> #<Date: 2001-02-04 ...>
# d.strftime('%a %d %b %Y')    #=> "Sun 04 Feb 2001"
