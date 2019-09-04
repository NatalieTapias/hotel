require_relative "test_helper.rb"

describe "Room_test initialize" do
  let(:r1){ Room.new(1, :unavailable) }
  let(:r2){ Room.new(2) }
  let(:r3){ Room.new("hi") }
  let(:r4){ Room.new(1, :hello) }
  let(:r5){ Room.new("hi", :easy) }
  let(:r6) { Room.new(30, :unavailable) }
  
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
  
  it "Returns expected Room.cost" do
    expect(r1.cost).must_equal 200
  end
  
  it "Raises some kind of error if non-integer is provided as the ID" do
    expect{r3}.must_raise InvalidIDError
  end
  
  it "Raises InvalidStatusError with any invalid status" do
    expect{r4}.must_raise InvalidStatusError
  end
  
  it "Raises InvalidIDError with any invalid ID provided" do
    expect{r6}.must_raise InvalidIDError
  end
  
end