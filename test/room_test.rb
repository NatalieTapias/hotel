require_relative "test_helper.rb"
require_relative "../lib/date_range.rb"

describe "Room" do
  id = rand(1..20)
  let(:room){ Room.new(id) }
  
  let(:room_high_id) { Room.new(20) }
  let(:room_id_zero) { Room.new(0) }
  let(:room_id_too_high) { Room.new(30) }
  let(:room_id_too_low) { Room.new(-30) }
  let(:room_invalid_id){ Room.new("hi") }
  
  
  let(:short_date_range){ DateRange.new( Date.new(2001,02,03), Date.new(2001,02,04)) }
  let(:long_date_range){ DateRange.new(Date.new(2009,12,05), Date.new(2010,01,15)) }
  
  
  describe "initialize" do
    it "should create an instance of Room" do
      expect(room).must_be_instance_of Room
      expect(room_high_id).must_be_instance_of Room
      expect{room_id_zero}.must_raise ArgumentError
      expect{room_id_too_high}.must_raise ArgumentError
      expect{room_id_too_low}.must_raise ArgumentError
      expect{room_invalid_id}.wont_be_instance_of Room
    end
    describe "id" do
      it "should accurately return :id" do
        expect(room.id).must_equal id
        expect(room_high_id.id).must_equal 20      
      end
      
      it "should raise ArgumentError when invalid :id provided" do
        expect{room_id_too_high}.must_raise ArgumentError
        expect{room_invalid_id}.must_raise ArgumentError
        expect{room_id_too_low}.must_raise ArgumentError
      end
    end
    
    describe "reservation_list" do
      it "should initialize with an empty reservation_list Array" do
        expect(room.reservation_list).must_be_empty
        expect(room.reservation_list).must_be_instance_of Array
        expect(room_high_id.reservation_list).must_be_empty
        expect(room_high_id.reservation_list).must_be_instance_of Array
      end
    end
    
    describe "rate" do
      it "should accurately store and return :rate" do
        expect(room.rate).must_equal 200
        expect(room_high_id.rate).must_equal 200
      end
    end
  end
  
  describe "make_reservation" do
    let(:room_3){ Room.new(3)}
    it "should instantiate with 0 reservations" do
      expect(room_3.reservation_list).must_be_empty
    end
    
    it "should add DateRange objects to reservation_list when make_reservation is caled" do
      room_3.make_reservation(short_date_range)
      expect(room_3.reservation_list.length).must_equal 1
      room_3.make_reservation(long_date_range)
      expect(room_3.reservation_list.length).must_equal 2
    end
    
    it "should not add a reservation for a date range that overlaps with an existing reservation" do
    end
    
  end
  describe "total_cost" do 
    
    it "should accurately calculate the total_cost of a given reservation" do
      expect(room.total_cost(short_date_range)).must_equal 200
    end
    
  end
  
  
end




# let(:short_date_range) { DateRange.new(Date.new(2001,02,03), Date.new(2001,02,04)) }
# let(:extraordinarily_long_date_range) { DateRange.new(Date.new(2001,01,03), Date.new(2001,03,04)) }
# let(:short_date_range_copy) { DateRange.new(Date.new(2001,02,03), Date.new(2001,02,04)) } 
# let(:earlier_date_range) { DateRange.new(Date.new(1999,02,03), Date.new(1999,02,04)) }
# let(:edge_date_range_check_in_when_other_check_out){ DateRange.new(Date.new(2001,02,04), Date.new(2001,02,05))}
# let(:edge_date_range_check_out_when_other_check_in){ DateRange.new(Date.new(2001,02,01), Date.new(2001,02,03))}
# let(:long_date_range) { DateRange.new(Date.new(2009,12,05), Date.new(2010,01,15)) }
# let(:long_date_range_edge_starts_before) { DateRange.new(Date.new(2009,12,04), Date.new(2010,01,14)) }
# let(:long_date_range_edge_starts_within_extends_after) { DateRange.new(Date.new(2009,12,06), Date.new(2010,01,17)) }
# let(:within_long_date_range){ DateRange.new(Date.new(2009,12,06), Date.new(2009,12,07)) }
# let(:particular_date_within_short_range){ Date.new(2001,02,03) }
# let(:particular_date_out_of_short_range) { Date.new(2001,02,01) }
