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
describe "It Checks for Booking Dates Overlap" do
  before do
    dates = ["2001-02-01", "2001-02-02", "2001-02-03", "2001-02-04", "2001-02-05", "2001-02-06", "2001-02-07"]
    @booked_range = Hotel::Reservation_Date.new(dates[2], dates[4])
    @new_res_1 = Hotel::Reservation_Date.new(dates[2], dates[5]) #Same Start Date
    @new_res_2 = Hotel::Reservation_Date.new(dates[3], dates[5]) #Start Date in Middle of Booking
    @new_res_3 = Hotel::Reservation_Date.new(dates[1], dates[5]) #Starts Before, Ends After
    @new_res_4 = Hotel::Reservation_Date.new(dates[1], dates[3]) #Starts Before, Ends in Middle of Booking
    @new_res_4 = Hotel::Reservation_Date.new(dates[1], dates[2]) #Ends Same Day as Start
    @new_res_5 = Hotel::Reservation_Date.new(dates[4], dates[6]) #Starts and Same Day as End
  end
  it "Checks for Same Start Date" do
    Hotel::Reservation_Date.overlap_check(@new_res_1, @booked_range).must_equal false
  end
  it "Checks for Starting in Middle" do
    Hotel::Reservation_Date.overlap_check(@new_res_2, @booked_range).must_equal false
  end
  it "Checks for Starting Before, but Ending After" do
    Hotel::Reservation_Date.overlap_check(@new_res_3, @booked_range).must_equal false
  end
  it "Checks for Starting Before, but Ends in the Middle" do
    Hotel::Reservation_Date.overlap_check(@new_res_4, @booked_range).must_equal false
  end
  it "Checks for Starting Before, but Ending After" do
    Hotel::Reservation_Date.overlap_check(@new_res_3, @booked_range).must_equal false
  end
end
end
end