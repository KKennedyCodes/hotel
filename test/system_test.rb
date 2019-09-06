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
        reservation = @hotel_system.create_reservation("2014-02-04", "2014-02-05")
        reservation.must_be_kind_of Hotel::Reservation
      end
      
      it "Can Add a New Reservation to the Existing List" do
        no_reservations = @hotel_system.reservations.length
        reservation = @hotel_system.create_reservation("2014-02-04", "2014-02-05")
        @hotel_system.add_reservation(reservation)
        @hotel_system.reservations.length.must_equal (no_reservations + 1)
      end
      
      it "Can List All Reservations in an Array" do
        5.times do
          @hotel_system.add_reservation(@hotel_system.create_reservation("2014-02-04", "2014-02-05"))
        end
        @hotel_system.reservations.must_be_kind_of Array
      end
      
      it "Can Correctly List the First and Last Reservations in an Array" do
        @hotel_system.add_reservation(@hotel_system.create_reservation("2014-02-04", "2014-02-05"))
        @hotel_system.add_reservation(@hotel_system.create_reservation("2014-03-04", "2014-03-05"))
        @hotel_system.add_reservation(@hotel_system.create_reservation("2014-04-04", "2014-04-05"))
        @hotel_system.add_reservation(@hotel_system.create_reservation("2014-05-04", "2014-05-05"))
        @hotel_system.add_reservation(@hotel_system.create_reservation("2014-06-04", "2014-06-05"))  
        
        first_date = Hotel::Reservation_Date.new("2014-02-04", "2014-02-05")
        @hotel_system.reservations.first.reservation_date_range.must_equal first_date
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
end

