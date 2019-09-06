require_relative "test_helper"


describe "DateRange" do
  let(:three_feb){ Date.new(2001,02,3) }
  let(:four_feb){ Date.new(2001,02,4) }
  let(:eight_dec){ Date.new(2019,12,8) }
  let(:twenty_dec){ Date.new(2019,12,20) }
  let(:valid_dates) { DateRange.new(three_feb, four_feb) }
  let(:valid_dates_long_range) { DateRange.new(eight_dec, twenty_dec) }
  let(:invalid_dates) { DateRange.new("Natalie","George") }
  
  let(:invalid_dates_start_before_end) { DateRange.new(Date.new(2001,02,04),Date.new(2001,02,02)) }
  let(:invalid_dates_start_equals_end) { DateRange.new(Date.new(2001,02,04),Date.new(2001,02,04)) }
  
  describe "initialize" do
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
    
    it "should return an integer" do
      expect(valid_dates.length_of_stay).must_be_instance_of Integer
      expect(valid_dates_long_range.length_of_stay).must_be_instance_of Integer
    end 
  end
  
  describe "contains_date?" do
    it "should accurately respond to contains_date?" do
      within_range_date = Date.new(2019,12,16)
      out_of_range_date = Date.new(2019,12,21)
      last_day_date = Date.new(2019,12,20)
      first_day_date = Date.new(2019,12,8)
      
      expect(valid_dates_long_range.contains_date?(within_range_date)).must_equal true
      expect(valid_dates_long_range.contains_date?(out_of_range_date)).must_equal false
      expect(valid_dates_long_range.contains_date?(last_day_date)).must_equal true 
      expect(valid_dates_long_range.contains_date?(first_day_date)).must_equal true 
    end
  end
end