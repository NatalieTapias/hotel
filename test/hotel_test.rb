require_relative "test_helper"


describe "Hotel Class" do
  describe "Initialize" do
    let(:hotel){ Hotel.new }
    
    it "Should have no reservations" do
      expect(hotel.reservations).must_be_instance_of Array
      expect(hotel.reservations.length).must_equal 0
    end    
    
    it "Should have an array of 20 Rooms" do
      expect(hotel.rooms).must_be_instance_of Array
      expect(hotel.rooms.length).must_equal 20
      expect(hotel.rooms.first.id).must_equal 1
      expect(hotel.rooms.last.id).must_equal 20
    end
    
  end
end