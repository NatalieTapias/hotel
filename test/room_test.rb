require_relative "test_helper.rb"

describe "Room_test#initialize" do
  let(:r1){ Room.new(1,:unavailable)}
  
  it "When given an id and status, returns an instance of Room" do
    expect(r1).must_be_instance_of Room
  end
  
  it "Returns expected Room.id" do
    expect(r1.id).must_equal 1
  end
end