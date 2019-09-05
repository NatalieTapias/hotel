require_relative "test_helper.rb"

describe "Room" do
  
  let(:room){ Room.new(2) }
  let(:room_invalid_id){ Room.new("hi") }
  let(:room_id_too_high) { Room.new(30) }
  let(:room_id_too_low) { Room.new(-30) }
  
  describe "initialize" do
    it "should create an instance of Room" do
      expect(room).must_be_instance_of Room
      expect{room_invalid_id}.must_raise ArgumentError
    end
  end 
  
  describe "id" do
    it "should accurately return :id" do
      expect(room.id).must_equal 2
    end
    
    it "should raise ArgumentError when invalid :id provided" do
      expect{room_id_too_high}.must_raise ArgumentError
      expect{room_invalid_id}.must_raise ArgumentError
    end
    
  end
  
  describe "cost" do
    it "should accurately return :cost" do
      expect(room.cost).must_equal 200
    end
  end
end