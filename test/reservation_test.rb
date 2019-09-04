require_relative "test_helper.rb"


describe "Reservation" do
  
  room = Room.new(1, :available) 
  short_range = DateRange.new("2nd Feb 2019", "4th Feb 2019")
  long_range = DateRange.new("2nd Feb 2019", "20th Feb 2019")
  let(:booking_short_stay){Reservation.new(room, short_range)}
  let(:booking_long_stay){Reservation.new(room, long_range)}
  
  describe "initialize" do
    it "should create an instance of Reservation when valid Room and DateRange are provided" do
      expect(booking_short_stay).must_be_instance_of Reservation
      expect(booking_long_stay).must_be_instance_of Reservation
    end
    
    it "should return accurate information about :date_range" do
      expect(booking_short_stay.date_range).must_be_instance_of DateRange
      expect(booking_short_stay.date_range).must_equal short_range
      expect(booking_long_stay.date_range).must_be_instance_of DateRange
      expect(booking_long_stay.date_range).must_equal long_range
    end
    
    it "should return accurate information about :room" do
      expect(booking_short_stay.room).must_be_instance_of Room
      expect(booking_short_stay.room).must_equal room
      expect(booking_long_stay.room).must_be_instance_of Room
      expect(booking_long_stay.room).must_equal room
    end
  end
  
  describe "cost" do
    it "Returns expected cost" do
      expect(booking_short_stay.cost).must_equal 400
      expect(booking_long_stay.cost).must_equal 3600
    end
  end
  
  describe "length_of_stay" do
    it "should return accurate accurate value for length_of_stay" do
      expect(booking_long_stay.length_of_stay).must_equal long_range.length_of_stay
      expect(booking_short_stay.length_of_stay).must_equal short_range.length_of_stay
    end
    
    it "should return an integer" do
      expect(booking_long_stay.length_of_stay).must_be_instance_of Integer
    end
    
  end
end