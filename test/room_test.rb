require_relative "test_helper.rb"

describe "Room" do
  let(:room_unavailable){ Room.new(1, :unavailable) }
  let(:room_available){ Room.new(2) }
  let(:room_invalid_id){ Room.new("hi") }
  let(:room_invalid_status){ Room.new(1, :hello) }
  let(:room_invalid_id_and_status){ Room.new("hi", :easy) }
  let(:room_id_too_high) { Room.new(30, :unavailable) }
  
  describe "initialize" do
    it "should return an instance of Room when valid id and valid status given" do
      expect(room_unavailable).must_be_instance_of Room
      expect(room_available).must_be_instance_of Room
    end
  end 
  
  describe "room.id" do
    it "should accurately return room ID" do
      expect(room_unavailable.id).must_equal 1
    end
    
    it "Raises InvalidIDError with any invalid ID provided" do
      expect{room_id_too_high}.must_raise InvalidIDError
    end
    
    it "Raises some kind of error if non-integer is provided as the ID" do
      expect{room_invalid_id}.must_raise InvalidIDError
    end
  end
  
  describe "room.status" do
    it "Returns expected Room.status" do
      expect(room_unavailable.status).must_equal :unavailable
      expect(room_available.status).must_equal :available
    end
    
    it "Raises InvalidStatusError with any invalid status" do
      expect{room_invalid_status}.must_raise InvalidStatusError
    end
  end
  
  describe "room.cost" do
    it "should accurately return room.cost" do
      expect(room_unavailable.cost).must_equal 200
    end
  end
end