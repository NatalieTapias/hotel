require_relative "test_helper"


describe "Hotel" do
  let(:a_hotel){Hotel.new}
  
  describe "initialize" do
    it "should store a list of the 20 rooms in the hotel" do
      expect(a_hotel.rooms).must_be_instance_of Array
      expect(a_hotel.rooms.first.id).must_equal 1
      expect(a_hotel.rooms.last.id).must_equal 20
      expect(a_hotel.rooms.length).must_equal 20
    end
  end
  
  # describe "available_room_list" do

  # end
end