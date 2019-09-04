require_relative "date_range"


class Room
  attr_reader :id, :status, :cost
  
  def initialize(id, status=:available)
    incorrect_status?(status)
    incorrect_id?(id)
    @id = id
    @status = status
    @cost = 200
  end
  
  def incorrect_status?(given_status)
    if given_status != :available && given_status != :unavailable
      raise InvalidStatusError.new("#{given_status} is not a valid status for a Room.")
    end
  end
  
  def incorrect_id?(given_id)
    if given_id.class != Integer
      raise InvalidIDError
    elsif given_id > 20 || given_id < 1
      raise InvalidIDError
    end
  end 
end


class InvalidStatusError < StandardError
end

class InvalidIDError < StandardError
end
