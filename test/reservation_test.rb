require_relative "test_helper.rb"


describe "Reservation class" do
  a = Room.new(1, :available) 
  b = DateRange.new("2nd Feb 2019", "4th Feb 2019")
  let(:booking_1){Reservation.new(1, a, b)}
  
  it "Makes an instance of reservation" do
    expect(booking_1).must_be_instance_of Reservation
  end
  
  it "Returns accurate information about DateRange" do
    expect(booking_1.date_range).must_be_instance_of DateRange
    expect(booking_1.date_range).must_equal b
    expect(booking_1.date_range.start_date.mon).must_equal 2
    expect(booking_1.date_range.end_date.year).must_equal 2019
  end
  
  
  it "Returns accurate information about Room" do
    expect(booking_1.room).must_be_instance_of Room
    expect(booking_1.room).must_equal a
    expect(booking_1.room.status).must_equal :available
    expect(booking_1.room.id).must_equal 1
  end
  
  it "Raises an Error when a Room is not present" do
  end
  
  it "Raises an Error when a DateRange is not present" do
  end
  
end