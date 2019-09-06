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
  let(:extraordinarily_long_date_range) { DateRange.new(Date.new(2001,01,03), Date.new(2001,03,04)) }
  let(:short_date_range_copy) { DateRange.new(Date.new(2001,02,03), Date.new(2001,02,04)) } 
  let(:earlier_date_range) { DateRange.new(Date.new(1999,02,03), Date.new(1999,02,04)) }
  let(:edge_date_range_check_in_when_other_check_out){ DateRange.new(Date.new(2001,02,04), Date.new(2001,02,05))}
  let(:edge_date_range_check_out_when_other_check_in){ DateRange.new(Date.new(2001,02,01), Date.new(2001,02,03))}
  let(:long_date_range) { DateRange.new(Date.new(2009,12,05), Date.new(2010,01,15)) }
  let(:long_date_range_edge_starts_before) { DateRange.new(Date.new(2009,12,04), Date.new(2010,01,14)) }
  let(:long_date_range_edge_starts_within_extends_after) { DateRange.new(Date.new(2009,12,06), Date.new(2010,01,17)) }
  let(:within_long_date_range){ DateRange.new(Date.new(2009,12,06), Date.new(2009,12,07)) }
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
  
  describe "date_range_overlaps?" do
    it "should return false when two date ranges overlap" do
      expect(room.date_range_overlaps?(short_date_range,short_date_range_copy)).must_equal false
    end
    it "should return true for when start/end dates overlap from two date ranges (can check in on the date that a check-out occurs for a room)" do
      expect(room.date_range_overlaps?(short_date_range,edge_date_range_check_in_when_other_check_out)).must_equal true
      expect(room.date_range_overlaps?(short_date_range,edge_date_range_check_out_when_other_check_in)).must_equal true
    end
    # when date ranges are not intersecting, and occur either before or after existing date range
    it "should return true for proposed date ranges that are significantly before/significantly after existing date range" do
      expect(room.date_range_overlaps?(short_date_range,long_date_range)).must_equal true
      expect(room.date_range_overlaps?(short_date_range,earlier_date_range)).must_equal true
    end
    # when one date is within range but extends out of range and (both sides)
    it "should return false when any part of a range intersects with another range" do
      expect(room.date_range_overlaps?(long_date_range,long_date_range_edge_starts_before)).must_equal false
      expect(room.date_range_overlaps?(long_date_range,long_date_range_edge_starts_within_extends_after)).must_equal false
    end
    
    # when within the range returns false
    it "should return false when the proposed date range falls within the existing date range" do
      expect(room.date_range_overlaps?(long_date_range,within_long_date_range)).must_equal false
    end
    
    it "should return false when the proposed range spans an existing range " do
      expect(room.date_range_overlaps?(short_date_range,extraordinarily_long_date_range)).must_equal false
    end
  end
end