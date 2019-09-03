require_relative "test_helper"


describe "DateRange#initialize" do
  let(:d1) { DateRange.new("3rd Feb 2001","4th Feb 2001") }
  let(:d2) { DateRange.new("8th Dec 2019","20th Dec 2019") }
  
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
end