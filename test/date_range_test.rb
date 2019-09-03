require_relative "test_helper"


describe "Date Range" do
  it "When given a start and end date, returns an instance of DateRange" do
    date = DateRange.new(1,2)
    expect(date).must_be_instance_of DateRange
  end
end