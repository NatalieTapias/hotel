require_relative "test_helper"


describe "DateRange" do
  let(:valid_dates){ DateRange.new(Date.new(2001,02,3), Date.new(2001,02,4)) }
  let(:valid_dates_long_range){ DateRange.new(Date.new(2019,12,8), Date.new(2019,12,20)) }
  let(:intersecting_long_range){ DateRange.new(Date.new(2019,12,9), Date.new(2019,12,10))}
  let(:check_in_on_checkout_day){ DateRange.new(Date.new(2019,12,20), Date.new(2020,1,1)) }
  let(:check_out_on_checkin_day){ DateRange.new(Date.new(2019,12,4), Date.new(2019,12,8)) }
  let(:end_date_within_range){ DateRange.new(Date.new(2019,12,4), Date.new(2019,12,20)) }
  let(:start_date_within_range){ DateRange.new(Date.new(2019,12,9), Date.new(2019,12,31)) }
  let(:range_spans_long_range){ DateRange.new(Date.new(2019,12,4), Date.new(2020,01,20)) }
  let(:short_range_within_long_range){ DateRange.new(Date.new(2019,12,10), Date.new(2019,12,18)) }
  let(:range_way_before){ DateRange.new(Date.new(2010,12,8), Date.new(2010,12,20)) }
  let(:range_way_after){ DateRange.new(Date.new(2020,12,8), Date.new(2020,12,20)) }
  
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
  
  describe "date_range_overlaps?" do
    it "should return a boolean" do
      expect(valid_dates_long_range.date_range_overlaps?(intersecting_long_range)).must_equal true
    end
    it "should accurately return true to allow for checkin/checkout date overlap" do
      expect(valid_dates_long_range.date_range_overlaps?(check_in_on_checkout_day)).must_equal false
      expect(valid_dates_long_range.date_range_overlaps?(check_out_on_checkin_day)).must_equal false
    end
    it "should return true when there is an overlap" do
      # range equals range
      expect(valid_dates_long_range.date_range_overlaps?(valid_dates_long_range)).must_equal true
      # end date within a range 
      expect(valid_dates_long_range.date_range_overlaps?(end_date_within_range)).must_equal true
      # start date within a range
      expect(valid_dates_long_range.date_range_overlaps?(start_date_within_range)).must_equal true
      # range encapsulates range
      expect(valid_dates_long_range.date_range_overlaps?(range_spans_long_range)).must_equal true
      # range is within other range
      expect(valid_dates_long_range.date_range_overlaps?(short_range_within_long_range)).must_equal true
    end
    
    it "should return false when a date range is significantly out of range (before or after)" do
      expect(valid_dates_long_range.date_range_overlaps?(range_way_after)).must_equal false
      expect(valid_dates_long_range.date_range_overlaps?(range_way_before)).must_equal false
      
      
    end
  end
end
