# require_relative 'test_helper'

# # describe "Reservation" do
# #   #Assumption: Date Formatting = '2001-02-03, YEAR-MO-DY'
# #   describe "Initialize" do
# #     it "Creates an Instance of Reservation" do

# #       reservation = Hotel::Reservation.new(2, "2001-02-03", "2001-02-05", 200)
# #       reservation.must_be_kind_of Hotel::Reservation
# #     end

# #     it "Keeps Track of Room Number" do
# #       room_num = 2
# #       reservation = Hotel::Reservation.new(room_num, "2001-02-03", "2001-02-05", 200)
# #       reservation.room_num.must_equal 2
# #     end

# #     it "Keeps Track of Room Rate" do
# #       rate = 150.00
# #       reservation = Hotel::Reservation.new(2, "2001-02-03", "2001-02-05", rate)
# #       reservation.rate.must_equal rate
# #     end 

# # it "Keeps Track of Reservation Dates" do
# #   start_date = "2001-02-03"
# #   end_date = "2001-02-05"
# #   dates = Hotel::Reservation.new(start_date: start_date, end_date: end_date)
# #   dates.must_be_type_of Array
# # end 

# # it "Keeps Track of Total Cost" do
# #   room = 2
# #   start_date = "2001-02-03"
# #   end_date = "2001-02-05"
# #   rate = 200
# #   reservation = Hotel::Reservation.new(room, start_date, end_date, rate)
# #   reservation.total_cost.must_equal 400
# # end 

# end

# describe "Reservation Methods" do
#   before do
#     room_num = 2
#     start_date = "2001-02-03"
#     end_date = "2001-02-05"
#     rate = 200
#     @reservation = Hotel::Reservation.new(room_num, start_date, end_date, rate)
#   end

#   # it "Adds a Reservation" do
#   #   no_reservations = @reservation.log.length
#   #   new_reservation = @reservation.add_reservation
#   #   new_reservation = @reservation.log.length
#   #   new_reservation.must_equal (no_reservations + 1)

#   # end
# end
# end
