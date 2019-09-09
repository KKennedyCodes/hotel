require_relative 'test_helper'

describe "System" do
  
  describe "Initialize" do
    
    it "Creates an Instance of Hotel System" do
      hotel_system = Hotel::System.new
      hotel_system.must_be_kind_of Hotel::System  
    end
    
    it "Keeps Track of Rooms" do
      hotel_system = Hotel::System.new
      hotel_system.must_respond_to :rooms
      hotel_system.rooms.must_be_kind_of Array
    end
    
    it "Keeps Track of Reservations" do
      hotel_system = Hotel::System.new
      hotel_system.must_respond_to :reservations
      hotel_system.reservations.must_be_kind_of Array
    end
  end
  describe "Methods" do
    before do
      @hotel_system = Hotel::System.new
    end
    describe "Reservation Add/Check/All/Find Methods" do
      it "Can Create a New Reservation" do
        reservation = @hotel_system.create_reservation(start_date: "2014-02-04", end_date: "2014-02-05")
        reservation.must_be_kind_of Hotel::Reservation
      end
      
      it "Can Add a New Reservation to the Existing List" do
        no_reservations = @hotel_system.reservations.length
        reservation = @hotel_system.create_reservation(start_date: "2014-02-04", end_date: "2014-02-05")
        @hotel_system.add_reservation(reservation)
        @hotel_system.reservations.length.must_equal (no_reservations + 1)
      end
      
      it "Can List All Reservations in an Array" do
        5.times do
          @hotel_system.add_reservation(@hotel_system.create_reservation(start_date: "2014-02-04", end_date: "2014-02-05"))
        end
        @hotel_system.reservations.must_be_kind_of Array
        @hotel_system.reservations.length.must_equal 5
      end
    end
    
    describe "Find a List a Rooms by Availability" do
      before do
        @hotel_system = Hotel::System.new
        @room_nums = [1, 2, 3, 4, 5]
        @first_date_start = "2014-02-04"
        @first_date_end = "2014-02-05"
        @last_date_start = "2014-06-04"
        @last_date_end = "2014-06-05"
        @rate = 200
        @hotel_system.add_reservation(@hotel_system.create_reservation(room_num: @room_nums[0], start_date: @first_date_start, end_date: @first_date_end, rate: @rate))
        @hotel_system.add_reservation(@hotel_system.create_reservation(room_num: @room_nums[1], start_date: "2014-03-04", end_date: "2014-03-05", rate: @rate))
        @hotel_system.add_reservation(@hotel_system.create_reservation(room_num: @room_nums[2], start_date: "2014-04-04", end_date: "2014-04-05", rate: @rate))
        @hotel_system.add_reservation(@hotel_system.create_reservation(room_num: @room_nums[3], start_date: "2014-05-04", end_date: "2014-05-05", rate: @rate))
        @hotel_system.add_reservation(@hotel_system.create_reservation(room_num: @room_nums[4], start_date: @last_date_start, end_date: @last_date_end, rate: @rate))
        @booking_date = Hotel::Reservation_Date.new(@first_date_start, @first_date_end) 
      end
      
      it "Can Correctly List the First and Last Reservations in an Array" do
        @first_date = Hotel::Reservation_Date.new(@first_date_start, @first_date_end)
        @hotel_system.reservations.first.reservation_date_range.start_date.must_equal @first_date.start_date
        @hotel_system.reservations.first.reservation_date_range.end_date.must_equal @first_date.end_date
        
        @last_date = Hotel::Reservation_Date.new(@last_date_start, @last_date_end)
        @hotel_system.reservations.last.reservation_date_range.start_date.must_equal @last_date.start_date
        @hotel_system.reservations.last.reservation_date_range.end_date.must_equal @last_date.end_date
      end
      
      it "Can Return a List of Bookings for a Particular Date" do
        hotel = @hotel_system.find_booked(@booking_date)
        hotel.must_be_kind_of Array
        hotel.length.must_equal 1
      end
      
      # it "Can Return a List of Bookings not Included in a Specific Date" do
      #   hotel = @hotel_system.find_available(@booking_date)
      #   hotel.must_be_kind_of Array
      #   hotel.length.must_equal 4
      # end
    end
    describe "Room Class Methods" do
      #Other Tests on Hotel::Room can be found in room_test.rb
      it "Can Access a List of Rooms in the Hotel" do
        room_list = Hotel::Room.all
        room_list.must_be_kind_of Array
      end
    end
    
  end 
end

