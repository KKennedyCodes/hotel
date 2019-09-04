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
    
    it "Checks for a Valid Date Range" do
      expect {
        range = Hotel::Reservation_Date.new("2001-02-03", "2001-02-01")
        range.date_range
      }.must_raise ArgumentError
      
      range = Hotel::Reservation_Date.new("2001-02-01", "2001-02-03")
      range.date_range.must_equal 2
    end
    
    #   id = 500
    #   product = FarMar::Product.find(id)
    #   product.must_be_kind_of FarMar::Product
    #   product.id.must_equal id
  end
  #   it "Keeps Track of Total of Nights" do
  #     rate = 175
  #     date = Hotel::date.new(5, rate) 
  #     date.must_respond_to :rate
  #     date.rate.must_equal rate  
  #   end
  
  #   it "Checks for a Valid Total of Nights" do
  #     proc {
  #       Hotel::date.new(2, -35)
  #     }.must_raise ArgumentError
  #     proc {
  #       Hotel::date.new(2, 0)
  #     }.must_raise ArgumentError
  #   end
  # end
  
  # xdescribe "All" do
  #   before do
  #     @dates = Hotel::date.all
  #   end
  #   it "Returns an Array of Dates" do
  #     @dates.must_be_kind_of Array
  #   end
  #   it "Returns an Collection of Dates" do
  #     @dates.each do |date|
  #       date.must_be_kind_of Hotel::date
  #     end
  #   end
  
  #   it "Returns the Correct Number of Dates" do
  #     @dates.length.must_equal 20
  #   end
  
  #   it "Returns the Correct First Date" do
  #     @dates.first.date_num.must_equal 1
  #   end
  
  #   it "Returns the Correct Last Date" do
  #     @dates.last.date_num.must_equal 20
  #   end
  
  #   it "Returns the Correct Total of Nights"
  # end
end