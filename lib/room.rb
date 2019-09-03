# require_relative "date_range"


class Room
  attr_reader :id, :status
  
  def initialize(id, status)
    @id = id
    @status = :available
  end
  
end
