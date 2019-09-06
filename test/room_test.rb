require_relative "test_helper.rb"
require_relative "../lib/date_range.rb"

describe "Room" do
  
  let(:room){ Room.new(2) }
  let(:room_high_id) { Room.new(20) }
  let(:room_id_zero) { Room.new(0) }
  let(:room_invalid_id){ Room.new("hi") }
  let(:room_id_too_high) { Room.new(30) }
  let(:room_id_too_low) { Room.new(-30) }
  let(:short_date_range) { DateRange.new(Date.new(2001,02,03), Date.new(2001,02,04)) }
  let(:long_date_range) { DateRange.new(Date.new(2009,12,05), Date.new(2010,01,15)) }
  let(:room_with_reservation) { Room.new(2) }
  
  let(:particular_date_within_short_range){ Date.new(2001,02,03) }
  let(:particular_date_out_of_short_range) { Date.new(2001,02,01) }
  
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
  
  # describe "room_available_on_date?" do
  #   it "returns an array of available Rooms" do
  #     room_with_reservation.make_reservation(short_date_range)
  #     expect(room_with_reservation.reservation_list).must_be_instance_of Array
  #     expect(room_with_reservation.room_available_on_date?(particular_date_out_of_short_range)).must_be_instance_of Room #room
  #   end
  # end
  
end