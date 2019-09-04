require_relative "test_helper.rb"


describe "Reservation class" do
  a = Room.new(1, :available) 
  b = DateRange.new("2nd Feb 2019", "4th Feb 2019")
  let(:booking_1){Reservation.new(1, a, b)}
  
  it "Makes an instance of reservation" do
    expect(booking_1).must_be_instance_of Reservation
  end
end