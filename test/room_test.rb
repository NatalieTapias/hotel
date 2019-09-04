require_relative "test_helper.rb"

describe "Room" do
  let(:room_unavailable){ Room.new(1, :unavailable) }
  let(:room_available){ Room.new(2) }
  let(:room_invalid_id){ Room.new("hi") }
  let(:room_invalid_status){ Room.new(1, :hello) }
  let(:room_invalid_id_and_status){ Room.new("hi", :easy) }
  let(:room_id_too_high) { Room.new(30, :unavailable) }
  let(:room_id_too_low) { Room.new(-30, :unavailable) }
  
  describe "initialize" do
    it "should create an instance of Room when valid id and valid status given" do
      expect(room_unavailable).must_be_instance_of Room
      expect(room_available).must_be_instance_of Room
      expect{room_invalid_id}.must_raise ArgumentError
    end
  end 
  
  describe "id" do
    it "should accurately return :id" do
      expect(room_unavailable.id).must_equal 1
    end
    
    it "should raise ArgumentError when invalid :id provided" do
      expect{room_id_too_high}.must_raise ArgumentError
      expect{room_invalid_id}.must_raise ArgumentError
    end
    
  end
  
  describe "status" do
    it "should return accurate :status" do
      expect(room_unavailable.status).must_equal :unavailable
      expect(room_available.status).must_equal :available
    end
    
    it "should raise ArgumentError when invalid :status is provided" do
      expect{room_invalid_status}.must_raise ArgumentError
      expect{room_invalid_id_and_status}.must_raise ArgumentError
      expect{room_id_too_low}.must_raise ArgumentError
    end
  end
  
  describe "cost" do
    it "should accurately return :cost" do
      expect(room_unavailable.cost).must_equal 200
    end
  end
end