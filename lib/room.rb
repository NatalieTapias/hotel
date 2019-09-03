# require_relative "date_range"


class Room
  attr_reader :id, :status
  
  def initialize(id, status=:available)
    @id = id
    @status = status
  end
  
end
