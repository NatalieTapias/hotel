require_relative "test_helper"


describe "DateRange#initialize" do
  let(:d1) { DateRange.new("3rd Feb 2001","4th Feb 2001") }
  let(:d2) { DateRange.new("8th Dec 2019","20th Dec 2019") }
  let(:d3) { DateRange.new("Natalie","George") }
  let(:d4) { DateRange.new("4th Feb 2001","2nd Feb 2001") }
  let(:d5) { DateRange.new("4th Feb 2001","4th Feb 2001") }
  
  it "When given a start and end date, returns an instance of DateRange" do
    expect(d1).must_be_instance_of DateRange
  end
  
  it "DateRange#start_date returns accurate Date object" do
    expect(d1.start_date.year).must_equal 2001
    expect(d1.start_date.mon).must_equal 2
    expect(d2.start_date.strftime('%d %b %Y')).must_equal "08 Dec 2019" 
  end
  
  it "DateRange#end_date returns accurate end date" do
    expect(d2.end_date.year).must_equal 2019
    expect(d2.end_date.mon).must_equal 12
    expect(d1.end_date.strftime('%d %b %Y')).must_equal "04 Feb 2001"
  end
  
  it "Expects Successfully Parses Start Date String as instance of Date" do
    expect(d2.start_date).must_be_instance_of Date
  end
  
  it "Raises ArgumentError when arguments are not appropriately provided" do
    expect{d3}.must_raise ArgumentError 
  end
  
  it "Raises a special error when invalid date range is provided (same date)" do
    expect{d4}.must_raise InvalidDateRangeError
  end
  
  it "Raises a special error when invalid date range is provided (end_date is before start_date)" do
    expect{d5}.must_raise InvalidDateRangeError
  end
  
  it "Accurately calculates length_of_stay" do
    expect(d1.length_of_stay).must_equal 1
    expect(d2.length_of_stay).must_equal 12
  end 
  
  it "Should return true or false if date is within range" do
    # the below are true
    # first
    expect(d2.contains_date?("8th Dec 2019")).must_equal true
    # last
    expect(d2.contains_date?("20th Dec 2019")).must_equal true
    # middle
    expect(d2.contains_date?("15th Dec 2019")).must_equal true
    
    # the below are false
    # too far out 
    expect(d2.contains_date?("30th Jan 2020")).must_equal false
    # too far early
    expect(d2.contains_date?("22nd May 2018")).must_equal false
  end
end