require_relative "date_range"


class Room
  attr_reader :id, :status
  
  def initialize(id, status=:available)
    incorrect_status?(status)
    @id = id
    @status = status
    
  end
  
  def incorrect_status?(given_status)
    if given_status != :available && given_status != :unavailable
      raise InvalidStatusError
    end
  end
end

class InvalidStatusError < StandardError
  
end
