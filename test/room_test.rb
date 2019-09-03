require_relative "test_helper.rb"

describe "Room_test#initialize" do
  let(:r1){ Room.new(1,:unavailable) }
  let(:r2){ Room.new(2) }
  let(:r3){ Room.new("hi") }
  let(:r4){ Room.new(1, :hello) }
  
  it "When given an id and status, returns an instance of Room" do
    expect(r1).must_be_instance_of Room
  end
  
  it "Returns expected Room.id" do
    expect(r1.id).must_equal 1
  end
  
  it "Returns expected Room.status" do
    expect(r1.status).must_equal :unavailable
    expect(r2.status).must_equal :available
  end
  
  it "Raises some kind of error if non-integer is provided as the ID" do
    expect(r3.id).must_be :==,"hi"
  end
  
  it "Raises ArgumentError with any invalid status" do
    expect{r4}.must_raise InvalidStatusError
  end
end