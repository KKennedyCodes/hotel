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
    
    describe "Methods" do
      before do
        @hotel_system = Hotel::System.new
      end
      
      it "Can Create a New Reservation" do
        reservation = @hotel_system.create_reservation("2014-02-04", "2014-02-05")
        reservation.must_be_kind_of Hotel::Reservation
      end
      
      it "Can Add a New Reservation to the Existing List" do
        reservation = @hotel_system.create_reservation("2014-02-04", "2014-02-05")
        5.times do
          @hotel_system.add_reservation(reservation)
        end
        @hotel_system.reservations.length.must_equal 5
      end
      
      # describe "Room Class Access" do
      #   it "Can Access a List of Rooms in the Hotel" do
      #     room_list = Hotel::Room.all
      #     room_list.must_be_kind_of Array
      #     #Other Tests on Hotel::Room can be found in room_test.rb
      #   end
      # end
    end
  end
end
