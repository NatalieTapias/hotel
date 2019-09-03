require_relative "test_helper"


describe DateRange do
  let(:d1) { DateRange.new("3rd Feb 2001","4th Feb 2001") }
  let(:d2) { DateRange.new("8th Dec 2001","20th Dec 2001") }
  
  it "When given a start and end date, returns an instance of DateRange" do
    expect(d1).must_be_instance_of DateRange
  end
  
  it "DateRange#start_date returns accurate Date object" do
    expect(d1.start_date.year).must_equal 2001
    expect(d1.start_date.mon).must_equal 2
    expect(d2.start_date.strftime('%d %b %Y')).must_equal "08 Dec 2001" 
  end
  
  it "DateRange#end_date returns accurate end date" do
  end
  
  it "Expects Successfully Parses Start Date String as instance of Date" do
    expect(d2.start_date).must_be_instance_of Date
  end
end