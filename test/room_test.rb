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
  let(:short_overlaping_range){ DateRange.new( Date.new(2001,02,02), Date.new(2001,02,04)) }
  let(:long_date_range){ DateRange.new(Date.new(2009,12,05), Date.new(2010,01,15)) }
  let(:long_date_range_copy){ DateRange.new(Date.new(2009,12,05), Date.new(2010,01,15)) }
  
  
  
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
      room_3.make_reservation(short_date_range)
      expect{room_3.make_reservation(short_overlaping_range)}.must_raise StandardError
      room_3.make_reservation(long_date_range)
      expect{room_3.make_reservation(long_date_range_copy)}.must_raise StandardError
      
    end
    
  end
  describe "total_cost" do 
    it "should accurately calculate the total_cost of a given reservation" do
      expect(room.total_cost(short_date_range)).must_equal 200
    end
  end
  
  describe "reservation_exists?" do
    let(:room_4){ Room.new(4)}
    let(:out_of_range){DateRange.new(Date.new(2008,12,05), Date.new(2009,01,15)) } 
    it "should return a boolean" do
      room_4.make_reservation(short_date_range)
      room_4.make_reservation(long_date_range)
      expect(room_4.reservation_exists?(long_date_range)).must_equal true
      expect(room_4.reservation_exists?(out_of_range)).must_equal false
    end
    
    it "should accurately determine whether a reservation already exists" do
      room_4.make_reservation(short_date_range)
      checks_in_as_short_date_range_ends = DateRange.new( Date.new(2001,02,04), Date.new(2001,02,05)) 
      checks_out_as_short_date_range_begins = DateRange.new( Date.new(2001,02,02), Date.new(2001,02,03)) 
      expect(room_4.reservation_exists?(short_date_range)).must_equal true
      expect(room_4.reservation_exists?(checks_in_as_short_date_range_ends)).must_equal false
      expect(room_4.reservation_exists?(checks_out_as_short_date_range_begins)).must_equal false
      
    end
    
  end
  
end


