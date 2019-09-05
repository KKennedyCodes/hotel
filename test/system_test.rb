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
    
    # describe "Methods" do
    #   describe "Room Class Access" do
    #     it "Can Access a List of Rooms in the Hotel" do
    #       room_list = Hotel::Room.all
    #       room_list.must_be_kind_of Array
    #       #Other Tests on Hotel::Room can be found in room_test.rb
    #     end
    #   end
    # end
  end
end
