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
    
    # it "Keeps Track of Room Rate" do
    #   rate = 150.00
    #   reservation = Hotel::Reservation.new(2, "2001-02-03", "2001-02-05", rate)
    #   reservation.rate.must_equal rate
    # end 
    
    # it "Keeps Track of Total Cost" do
    #   room = 2
    #   start_date = "2001-02-03"
    #   end_date = "2001-02-05"
    #   rate = 200
    #   reservation = Hotel::Reservation.new(room, start_date, end_date, rate)
    #   reservation.total_cost.must_equal 400
    # end 
    
  end
  
  # describe "Reservation Methods" do
  #   before do
  #     room_num = 2
  #     start_date = "2001-02-03"
  #     end_date = "2001-02-05"
  #     rate = 200
  #     @reservation = Hotel::Reservation.new(room_num:, start_date:, end_date:, rate:)
  #   end
  
  # it "Adds a Reservation" do
  #   no_reservations = @reservation.log.length
  #   new_reservation = @reservation.add_reservation
  #   new_reservation = @reservation.log.length
  #   new_reservation.must_equal (no_reservations + 1)
  
  # end
  #end
end
