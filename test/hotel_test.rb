require_relative "test_helper"


describe "Hotel" do
  let(:a_hotel){ Hotel.new }
  let(:short_range){ DateRange.new(Date.new(2001,02,3), Date.new(2001,02,4)) }
  
  
  
  describe "initialize" do
    it "should store a list of 20 Rooms in an array" do
      expect(a_hotel.rooms).must_be_instance_of Array
      expect(a_hotel.rooms.first.id).must_equal 1
      expect(a_hotel.rooms.last.id).must_equal 20
      expect(a_hotel.rooms.length).must_equal 20
      expect(a_hotel.rooms.first).must_be_instance_of Room
    end
  end
  
  describe "make_reservation" do
    it "should make a reservation when all rooms are available" do
      a_hotel.make_reservation(short_range)
      expect(a_hotel.rooms.first.reservation_exists?(short_range)).must_equal true
    end
    
    it "should raise StandardError when all rooms unavailable" do
      20.times do
        a_hotel.make_reservation(short_range)
      end
      20.times do |i|
        expect(a_hotel.rooms[i].reservation_exists?(short_range)).must_equal true
      end
      # expect an error if I try to make a reservation for the 21st time
      expect{a_hotel.make_reservation(short_range)}.must_raise StandardError
    end
    
    it "should make a reservation when all but one room are unavailable" do
      20.times do |i|
        expect(a_hotel.rooms[i].reservation_list).must_be_instance_of Array
      end
      19.times do
        a_hotel.make_reservation(short_range)
      end
      
    end
  end
  
  describe "list of reservations" do
    
    it "should return an array of Rooms" do 
    end
    
  end
end




# describe "list_of_reservations" do
#   let(:a_hotel){ Hotel.new }
#   it "should return an array of rooms reserved on a particular date" do
#     date_range = DateRange.new(Date.new(2012,01,01),Date.new(2012,01,03))
#     a_hotel.rooms.first.make_reservation(date_range)
#     a_hotel.rooms[1].make_reservation(date_range)
#     a_hotel.rooms[2].make_reservation(date_range)
#     a_date = Date.new(2012,01,02)
#     expect(a_hotel.list_of_reservations(a_date)).must_be_instance_of Array
#     expect(a_hotel.list_of_reservations(a_date).first.id).must_equal 1  
#     expect(a_hotel.list_of_reservations(a_date)[1].id).must_equal 2
#     expect(a_hotel.list_of_reservations(a_date)[2].id).must_equal 3
#     expect(a_hotel.list_of_reservations(a_date).first).must_be_instance_of Room 

# end
# end

# describe "list_of_available_rooms" do
#   let(:a_hotel){ Hotel.new }

#   it "should return an array" do
#     date_range = DateRange.new(Date.new(2012,01,01),Date.new(2012,01,03))
#     a_hotel.rooms.first.make_reservation(date_range)
#     a_hotel.rooms[1].make_reservation(date_range)
#     a_hotel.rooms[2].make_reservation(date_range)
#     # a_date = Date.new(2012,01,02)

#     expect(a_hotel.list_of_available_rooms(date_range)).must_be_instance_of Array
#     expect(a_hotel.list_of_available_rooms(date_range).first).must_be_instance_of Room
#     expect(a_hotel.list_of_available_rooms(date_range).first.id).must_equal 1
#     expect(a_hotel.list_of_available_rooms(date_range).length).must_equal 3 
#   end
# end