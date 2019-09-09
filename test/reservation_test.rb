require_relative 'test_helper'

describe "Reservation" do
  
  describe "Initialize" do
    it "Creates an Instance of Reservation" do
      
      reservation = Hotel::Reservation.new(start_date: "2001-02-03", end_date: "2001-02-05")
      reservation.must_be_kind_of Hotel::Reservation  
    end
    
    it "Keeps Track of Qty of Nights" do
      reservation = Hotel::Reservation.new(start_date: "2001-02-03", end_date: "2001-02-05")
      reservation.must_respond_to :qty_of_nights
      reservation.qty_of_nights.must_equal 2
    end
    
    it "Keeps Track of Room Rate" do
      rate = 200
      reservation = Hotel::Reservation.new(room_num: 2, start_date: "2001-02-03", end_date: "2001-02-05", rate: rate)
      reservation.rate.must_equal rate
    end 
    
    it "Keeps Track of Total Cost" do
      room = 2
      start_date = "2001-02-03"
      end_date = "2001-02-05"
      rate = 200
      reservation = Hotel::Reservation.new(room_num: room, start_date: start_date, end_date: end_date, rate: rate)
      reservation.cost.must_equal 400
    end 
  end
end
