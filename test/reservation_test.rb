require_relative "test_helper.rb"


describe "Reservation class" do
  
  room = Room.new(1, :available) 
  short_range = DateRange.new("2nd Feb 2019", "4th Feb 2019")
  long_range = DateRange.new("2nd Feb 2019", "20th Feb 2019")
  let(:booking_short_stay){Reservation.new(room, short_range)}
  let(:booking_long_stay){Reservation.new(room, long_range)}
  
  it "Makes an instance of reservation" do
    expect(booking_short_stay).must_be_instance_of Reservation
  end
  
  it "Returns accurate information about DateRange" do
    expect(booking_short_stay.date_range).must_be_instance_of DateRange
    expect(booking_short_stay.date_range).must_equal short_range
  end
  
  it "Returns accurate information about Room" do
    expect(booking_short_stay.room).must_be_instance_of Room
    expect(booking_short_stay.room).must_equal room
  end
  
  it "Returns expected cost" do
    expect(booking_short_stay.cost).must_equal 400
    expect(booking_long_stay.cost).must_equal 3600
  end
  
  it "Returns the correct length of stay" do
    expect(booking_long_stay.length_of_stay).must_equal long_range.length_of_stay
    expect(booking_short_stay.length_of_stay).must_equal short_range.length_of_stay
  end
  
end