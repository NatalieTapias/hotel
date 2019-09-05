require_relative "test_helper"


describe "Hotel" do
  let(:a_hotel){Hotel.new}
  
  describe "initialize" do
    it "should have no reservations" do
      expect(a_hotel.reservations).must_be_instance_of Array
      expect(a_hotel.reservations.length).must_equal 0
    end    
    
    it "should have an array of 20 Rooms" do
      expect(a_hotel.rooms).must_be_instance_of Array
      expect(a_hotel.rooms.length).must_equal 20
      expect(a_hotel.rooms.first.id).must_equal 1
      expect(a_hotel.rooms.last.id).must_equal 20
    end
  end
  
  describe "make_reservation" do
    it "should make a valid reservation" do
      expect(a_hotel.reservations.length).must_equal 0
      
      a_hotel.make_reservation("3rd Feb 2019", "5th Feb 2019")
      
      expect(a_hotel.reservations.length).must_equal 1
      expect(a_hotel.reservations.first.date_range.start_date.mon).must_equal 2
      expect(a_hotel.reservations.first.date_range.start_date.year).must_equal 2019
      expect(a_hotel.reservations.first).must_be_instance_of Reservation
    end
    
    it "should raise ArgumnetError if date range is invalid" do
      expect(a_hotel.reservations.length).must_equal 0
      # Same start_date and end_date
      expect{a_hotel.make_reservation("5th Feb 2019", "5th Feb 2019")}.must_raise ArgumentError
      # start_date before end_date
      expect{a_hotel.make_reservation("5th Feb 2019", "3rd Feb 2019")}.must_raise ArgumentError
    end
  end
  
  describe "reservations_list" do
    date_in_range = "3rd Feb 2019"
    date_out_of_range = "2nd Feb 2019"
    it "should return an array of reservations" do
      # returns an empty array if no prior reservations loaded
      expect(a_hotel.reservations_list(date_in_range).length).must_equal 0
      
      # one reservation made
      a_hotel.make_reservation("3rd Feb 2019", "5th Feb 2019")
      
      # lookup a valid date and return an array with matching reservations
      expect(a_hotel.reservations_list(date_in_range).length).must_equal 1
      # returns an array
      expect(a_hotel.reservations_list(date_in_range)).must_be_instance_of Array
      
      # lookup an invalid date and return an array with matching reservation
      expect(a_hotel.reservations_list(date_out_of_range).length).must_equal 0
    end
  end
  
  describe "available_room_list" do
    # date_range = DateRange.new("2nd Dec 2019", "4th Dec 2019")
    let(:a_hotel){Hotel.new}
    date_in_range = "2nd Dec 2019"
    date_out_of_range = "1st Dec 2019"
    
    it "should return an array of available rooms" do
      expect(a_hotel.available_room_list("2nd Dec 2019", "4th Dec 2019").length).must_equal 20
      
      # one reservation made
      a_hotel.make_reservation("2nd Dec 2019", "4th Dec 2019")
      
      # returns an array of one fewer rooms after reservation made
      expect(a_hotel.available_room_list("2nd Dec 2019", "4th Dec 2019").length).must_equal 19
    end
    
    it "should return expected available rooms" do
      expect(a_hotel.available_room_list("2nd Dec 2019", "4th Dec 2019").length).must_equal 20
      a_hotel.make_reservation("5th January 2018", "10th January 2018")
      # this is a case where the last day of the range provided to available_room_list overlaps with an existing reservation
      expect(a_hotel.available_room_list("4th January 2018", "5th January 2018").length).must_equal 19
      
    end
  end
  
end