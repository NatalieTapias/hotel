require_relative "test_helper"


describe "DateRange" do
  let(:valid_dates) { DateRange.new("3rd Feb 2001","4th Feb 2001") }
  let(:valid_dates_long_range) { DateRange.new("8th Dec 2019","20th Dec 2019") }
  let(:invalid_dates) { DateRange.new("Natalie","George") }
  let(:invalid_dates_start_before_end) { DateRange.new("4th Feb 2001","2nd Feb 2001") }
  let(:invalid_dates_start_equals_end) { DateRange.new("4th Feb 2001","4th Feb 2001") }
  
  describe "#initialize" do
    
    it "should return an instance of DateRange" do
      expect(valid_dates).must_be_instance_of DateRange
      expect(valid_dates_long_range).must_be_instance_of DateRange
    end
    
    it "should accurately return instance of Date with .start_date" do
      expect(valid_dates.start_date).must_be_instance_of Date
      expect(valid_dates_long_range.start_date).must_be_instance_of Date
      expect(valid_dates.start_date.year).must_equal 2001
      expect(valid_dates.start_date.mon).must_equal 2
      expect(valid_dates_long_range.start_date.strftime('%d %b %Y')).must_equal "08 Dec 2019" 
    end
    
    it "should accurately return instance of Date with .end_date" do
      expect(valid_dates.end_date).must_be_instance_of Date
      expect(valid_dates_long_range.end_date).must_be_instance_of Date
      expect(valid_dates_long_range.end_date.year).must_equal 2019
      expect(valid_dates_long_range.end_date.mon).must_equal 12
      expect(valid_dates.end_date.strftime('%d %b %Y')).must_equal "04 Feb 2001"
    end
    
    it "should raise ArgumentError when start_date and end_date are invalid" do
      expect{invalid_dates}.must_raise ArgumentError 
      expect{invalid_dates_start_before_end}.must_raise ArgumentError
      expect{invalid_dates_start_equals_end}.must_raise ArgumentError
    end 
  end
  
  describe "length_of_stay" do
    it "should accurately calculate length_of_stay" do
      expect(valid_dates.length_of_stay).must_equal 1
      expect(valid_dates_long_range.length_of_stay).must_equal 12
      expect{invalid_dates.length_of_stay}.must_raise ArgumentError 
      expect{invalid_dates_start_before_end.length_of_stay}.must_raise ArgumentError
      expect{invalid_dates_start_equals_end.length_of_stay}.must_raise ArgumentError
    end 
  end
  
  describe "contains_date?" do
    it "should accurately respond to contains_date?" do
      # first day
      expect(valid_dates_long_range.contains_date?("8th Dec 2019")).must_equal true
      # last last day
      expect(valid_dates_long_range.contains_date?("20th Dec 2019")).must_equal true
      # middle day
      expect(valid_dates_long_range.contains_date?("15th Dec 2019")).must_equal true
      
      # the below are false
      # too far out day
      expect(valid_dates_long_range.contains_date?("30th Jan 2020")).must_equal false
      # too early day
      expect(valid_dates_long_range.contains_date?("22nd May 2018")).must_equal false
    end
  end
end