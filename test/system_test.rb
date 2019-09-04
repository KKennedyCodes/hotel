require_relative 'test_helper'

describe "System" do
  describe "Initialize" do
  end
  
  describe "Methods" do
    describe "Room Class Access" do
      it "Can Access a List of Rooms in the Hotel" do
        room_list = Hotel::Room.all
        room_list.must_be_kind_of Array
        #Other Tests on Hotel::Room can be found in room_test.rb
      end
    end
  end
end
