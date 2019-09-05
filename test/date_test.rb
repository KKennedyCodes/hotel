require_relative 'test_helper'

describe "Date" do
  #Assumption: Date Formatting = '2001-02-03, YEAR-MO-DY'
  describe "Initialize" do
    it "Creates an Instance of Date" do
      date = Hotel::Reservation_Date.new("2001-02-03", "2001-02-05")
      date.must_be_kind_of Hotel::Reservation_Date
    end
    
    it "Keeps Track of Start Date" do
      start_date = "2001-02-03"
      date = Hotel::Reservation_Date.new(start_date, "2001-02-05") 
      date.start_date.must_equal Date.parse(start_date)
    end
    
    it "Keeps Track of End Date" do
      end_date = "2001-02-05"
      date = Hotel::Reservation_Date.new("2001-02-03", end_date) 
      date.end_date.must_equal Date.parse(end_date)
    end  
    
  end
  
  describe "Date Fomattting and Valitidy Checks" do
    
    it "Checks for a Valid Date Formatting" do
      expect {
        Hotel::Reservation_Date.new("Invalid Start Date", "2001-02-03")
      }.must_raise ArgumentError
      expect {
        Hotel::Reservation_Date.new("abcd-ed-gh", "2001-02-03")
      }.must_raise ArgumentError
      expect {
        Hotel::Reservation_Date.new("2001-02-03", "Invalid Start Date")
      }.must_raise ArgumentError
      expect {
        Hotel::Reservation_Date.new("2001-02-03", "abcd-ed-gh")
      }.must_raise ArgumentError
    end
    
    it "Checks for a Valid Date" do
      expect {
        Hotel::Reservation_Date.new("2019-02-30", "2001-02-03")
      }.must_raise ArgumentError
      expect {
        Hotel::Reservation_Date.new("2001-02-03", "2019-14-30")
      }.must_raise ArgumentError
    end
    
    it "Checks for Valid Date Range" do
      expect {
        range = Hotel::Reservation_Date.new("2001-02-03", "2001-02-01")
        range.date_range
      }.must_raise ArgumentError
    end
    
    it "Calculates Date Range (Num of Nights)" do
      range = Hotel::Reservation_Date.new("2001-02-01", "2001-02-03")
      range.date_range.must_equal 2
    end
    
  end
end