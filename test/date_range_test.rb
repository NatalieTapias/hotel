require_relative "test_helper"


describe "DateRange#initialize" do
  let(:valid_dates) { DateRange.new("3rd Feb 2001","4th Feb 2001") }
  let(:valid_dates_long_range) { DateRange.new("8th Dec 2019","20th Dec 2019") }
  let(:invalid_dates) { DateRange.new("Natalie","George") }
  let(:invalid_dates_start_before_end) { DateRange.new("4th Feb 2001","2nd Feb 2001") }
  let(:invalid_dates_start_equals_end) { DateRange.new("4th Feb 2001","4th Feb 2001") }
  
  it "When given a start and end date, returns an instance of DateRange" do
    expect(valid_dates).must_be_instance_of DateRange
  end
  
  it "DateRange#start_date returns accurate Date object" do
    expect(valid_dates.start_date.year).must_equal 2001
    expect(valid_dates.start_date.mon).must_equal 2
    expect(valid_dates_long_range.start_date.strftime('%d %b %Y')).must_equal "08 Dec 2019" 
  end
  
  it "DateRange#end_date returns accurate end date" do
    expect(valid_dates_long_range.end_date.year).must_equal 2019
    expect(valid_dates_long_range.end_date.mon).must_equal 12
    expect(valid_dates.end_date.strftime('%d %b %Y')).must_equal "04 Feb 2001"
  end
  
  it "Expects Successfully Parses Start Date String as instance of Date" do
    expect(valid_dates_long_range.start_date).must_be_instance_of Date
  end
  
  it "Raises ArgumentError when arguments are not appropriately provided" do
    expect{invalid_dates}.must_raise ArgumentError 
  end
  
  it "Raises a special error when invalid date range is provided (same date)" do
    expect{invalid_dates_start_before_end}.must_raise InvalidDateRangeError
  end
  
  it "Raises a special error when invalid date range is provided (end_date is before start_date)" do
    expect{invalid_dates_start_equals_end}.must_raise InvalidDateRangeError
  end
  
  it "Accurately calculates length_of_stay" do
    expect(valid_dates.length_of_stay).must_equal 1
    expect(valid_dates_long_range.length_of_stay).must_equal 12
  end 
  
  it "Should return true or false if date is within range" do
    # the below are true
    # first
    expect(valid_dates_long_range.contains_date?("8th Dec 2019")).must_equal true
    # last
    expect(valid_dates_long_range.contains_date?("20th Dec 2019")).must_equal true
    # middle
    expect(valid_dates_long_range.contains_date?("15th Dec 2019")).must_equal true
    
    # the below are false
    # too far out 
    expect(valid_dates_long_range.contains_date?("30th Jan 2020")).must_equal false
    # too far early
    expect(valid_dates_long_range.contains_date?("22nd May 2018")).must_equal false
  end
end