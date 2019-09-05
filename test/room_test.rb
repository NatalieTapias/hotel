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
    
    it "should initialize with an empty #reservation_list Array" do
      expect(room.reservation_list).must_be_empty
      expect(room.reservation_list).must_be_instance_of Array
      expect(room_high_id.reservation_list).must_be_empty
      expect(room_high_id.reservation_list).must_be_instance_of Array
    end
  end
  
  describe "cost" do
    it "should accurately return :cost" do
      expect(room.cost).must_equal 200
      expect(room_high_id.cost).must_equal 200
    end
  end
  
  describe "make-reservation" do
    short_date_range = DateRange.new("3rd Feb 2001", "4th Feb 2001")
    long_date_range = DateRange.new("5th Dec 2009", "15th Jan 2010")
    
    it "should accurately return an array of DateRange instances once a reservation is made" do
      expect(room.reservation_list).must_be_instance_of Array
      
      # make a reservation
      room.make_reservation(short_date_range)
      expect(room.reservation_list.length).must_equal 1
      expect(room.reservation_list.first).must_be_instance_of DateRange
      
      # make a secod reservation for the same room
      room.make_reservation(long_date_range)
      expect(room.reservation_list.length).must_equal 2
      expect(room.reservation_list.last).must_be_instance_of DateRange
      
      # make a reservation for another room
      room_high_id.make_reservation(long_date_range)
      expect(room_high_id.reservation_list).must_be_instance_of Array
      expect(room_high_id.reservation_list.length).must_equal 1
      expect(room_high_id.reservation_list.last).must_be_instance_of DateRange
    end
  end
end