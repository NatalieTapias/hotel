require_relative "test_helper"


describe "Hotel Class" do
  let(:hotel){ Hotel.new }
  
  describe "initialize" do
    it "should have no reservations" do
      expect(hotel.reservations).must_be_instance_of Array
      expect(hotel.reservations.length).must_equal 0
    end    
    
    it "should have an array of 20 Rooms" do
      expect(hotel.rooms).must_be_instance_of Array
      expect(hotel.rooms.length).must_equal 20
      expect(hotel.rooms.first.id).must_equal 1
      expect(hotel.rooms.last.id).must_equal 20
    end
  end
  
  describe "make_reservation" do
    it "should make a valid reservation" do
      expect(hotel.reservations.length).must_equal 0
      
      hotel.make_reservation("3rd Feb 2019", "5th Feb 2019")
      
      expect(hotel.reservations.length).must_equal 1
      expect(hotel.reservations.first.date_range.start_date.mon).must_equal 2
      expect(hotel.reservations.first.date_range.start_date.year).must_equal 2019
      expect(hotel.reservations.first).must_be_instance_of Reservation
    end
    
    it "should throw an error if date range is invalid" do
      expect(hotel.reservations.length).must_equal 0
      
      # Same start_date and end_date
      expect{ 
        hotel.make_reservation("5th Feb 2019", "5th Feb 2019")
      }.must_raise InvalidDateRangeError
      
      # start_date before end_date
      expect{ 
        hotel.make_reservation("5th Feb 2019", "3rd Feb 2019")
      }.must_raise InvalidDateRangeError
    end
  end
  
  describe "reservations_list" do
    date_in_range = "3rd Feb 2019"
    date_out_of_range = "2nd Feb 2019"
    
    it "returns an array" do
      # returns an empty array if no prior reservations loaded
      expect(hotel.reservations_list(date_in_range).length).must_equal 0
      
      # one reservation made
      hotel.make_reservation("3rd Feb 2019", "5th Feb 2019")
      
      # lookup a valid date and return an array with matching reservations
      expect(hotel.reservations_list(date_in_range).length).must_equal 1
      
      # lookup an invalid date and return an array with matching reservation
      expect(hotel.reservations_list(date_out_of_range).length).must_equal 0
    end
    
  end
end