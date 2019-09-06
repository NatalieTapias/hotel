require_relative "test_helper"


describe "Hotel" do
  let(:a_hotel){ Hotel.new }
  
  describe "initialize" do
    it "should store a list of 20 Rooms in an array" do
      expect(a_hotel.rooms).must_be_instance_of Array
      expect(a_hotel.rooms.first.id).must_equal 1
      expect(a_hotel.rooms.last.id).must_equal 20
      expect(a_hotel.rooms.length).must_equal 20
    end
  end
  
  # describe "available_room_list" do
  #   early_date = Date.new(2019,07,01)
  #   it "should return an array of available rooms" do
  #     expect(a_hotel.available_room_list(early_date)).must_be_instance_of Array
  #   end
  # end
end