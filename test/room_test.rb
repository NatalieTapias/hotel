require_relative "test_helper.rb"
require_relative "../lib/date_range.rb"

describe "Room" do
  
  let(:room){ Room.new(2) }
  let(:room_high_id) { Room.new(20) }
  let(:room_id_zero) { Room.new(0) }
  let(:room_invalid_id){ Room.new("hi") }
  let(:room_id_too_high) { Room.new(30) }
  let(:room_id_too_low) { Room.new(-30) }
  
  describe "initialize" do
    it "should create an instance of Room" do
      expect(room).must_be_instance_of Room
      expect(room_high_id).must_be_instance_of Room
      expect{room_id_zero}.must_raise ArgumentError
      expect{room_id_too_high}.must_raise ArgumentError
      expect{room_invalid_id}.wont_be_instance_of Room
    end
    
    it "should accurately return :id" do
      expect(room.id).must_equal 2
      expect(room_high_id.id).must_equal 20      
    end
    
    it "should raise ArgumentError when invalid :id provided" do
      expect{room_id_too_high}.must_raise ArgumentError
      expect{room_invalid_id}.must_raise ArgumentError
      expect{room_id_too_low}.must_raise ArgumentError
    end
    
    it "should start with reservation_list as an empty array" do
      expect(room.reservation_list).must_be_empty
      expect(room.reservation_list).must_be_instance_of Array
    end
  end
  
  describe "cost" do
    it "should accurately return :cost" do
      expect(room.cost).must_equal 200
    end
  end
  
  describe "make-reservation" do
    date_range = DateRange.new("3rd Feb 2001", "4th Feb 2001")
    let(:room_short_stay){Room.new(3)}
    
    it "should return an array of DateRange instances" do
      
      expect(room_short_stay.reservation_list).must_be_instance_of Array
      room_short_stay.make_reservation(date_range)
      expect(room_short_stay.reservation_list.length).must_equal 1
      expect(room_short_stay.reservation_list.first).must_be_instance_of DateRange
    end
    #   room = Room.new(1) 
    #   short_range = DateRange.new("2nd Feb 2019", "4th Feb 2019")
    #   long_range = DateRange.new("2nd Feb 2019", "20th Feb 2019")
    #   let(:booking_short_stay){Reservation.new(room, short_range)}
    #   let(:booking_long_stay){Reservation.new(room, long_range)}
    
    #   describe "initialize" do
    #     it "should create an instance of Reservation when valid Room and DateRange are provided" do
    #       expect(booking_short_stay).must_be_instance_of Reservation
    #       expect(booking_long_stay).must_be_instance_of Reservation
    #     end
    
    #     it "should return accurate information about :date_range" do
    #       expect(booking_short_stay.date_range).must_be_instance_of DateRange
    #       expect(booking_short_stay.date_range).must_equal short_range
    #       expect(booking_long_stay.date_range).must_be_instance_of DateRange
    #       expect(booking_long_stay.date_range).must_equal long_range
    #     end
    
    #     it "should return accurate information about :room" do
    #       expect(booking_short_stay.room).must_be_instance_of Room
    #       expect(booking_short_stay.room).must_equal room
    #       expect(booking_long_stay.room).must_be_instance_of Room
    #       expect(booking_long_stay.room).must_equal room
    #     end
    #   end
    
    #   describe "cost" do
    #     it "should return expected cost" do
    #       expect(booking_short_stay.cost).must_equal 400
    #       expect(booking_long_stay.cost).must_equal 3600
    #     end
    
    #     it "should be a float" do
    #       expect(booking_long_stay.cost).must_be_instance_of Float
    #       expect(booking_short_stay.cost).must_be_instance_of Float 
    #     end
    #   end
    
    #   describe "length_of_stay" do
    #     it "should return accurate accurate value for length_of_stay" do
    #       expect(booking_long_stay.length_of_stay).must_equal long_range.length_of_stay
    #       expect(booking_short_stay.length_of_stay).must_equal short_range.length_of_stay
    #     end
    
    #     it "should return an integer" do
    #       expect(booking_short_stay.length_of_stay).must_be_instance_of Integer
    #       expect(booking_long_stay.length_of_stay).must_be_instance_of Integer
    #     end
    #   end
    
  end
end