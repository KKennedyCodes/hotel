require_relative 'test_helper'

describe "Room" do
  describe "Initialize" do
    it "Creates an Instance of Room" do
      room = Hotel::Room.new(2)
      room.must_be_kind_of Hotel::Room
    end
    
    it "Keeps Track of Room Number" do
      room_num = 4
      room = Hotel::Room.new(room_num) 
      room.must_respond_to :room_num
      room.room_num.must_equal room_num
    end
    
    #failing test
    it "Keeps Track of Room Rate" do
      rate = 200.to_f
      room = Hotel::Room.new(5)
      room.must_respond_to :rate
      room.rate.must_equal rate 
    end
    
    it "Checks for a Valid Room Rate" do
      proc {
        Hotel::Room.new(2, -35)
      }.must_raise ArgumentError
      proc {
        Hotel::Room.new(2, 0)
      }.must_raise ArgumentError
    end
  end
  
  describe "All" do
    before do
      @rooms = Hotel::Room.all
    end
    it "Returns an Array List of Rooms" do
      @rooms.must_be_kind_of Array
    end
    it "Returns an Collection of Rooms" do
      @rooms.each do |room|
        room.must_be_kind_of Hotel::Room
      end
    end
    
    it "Returns the Correct Number of Rooms" do
      @rooms.length.must_equal 20
    end
    
    it "Returns the Correct First Room" do
      @rooms.first.room_num.must_equal 1
    end
    
    it "Returns the Correct Last Room" do
      @rooms.last.room_num.must_equal 20
    end
  end
  
  describe "Find" do
    before do
      @rooms = Hotel::Room.all
    end
    
    it "Returns a Room Object" do
      Hotel::Room.find(5).must_be_kind_of Hotel::Room
    end
    
    it "Returns a Correct Room Number" do
      room_number = 5
      room = Hotel::Room.find(room_number)
      room.room_num.must_equal room_number
    end
    
    it "Returns a Correct Room Rate" do
      nightly_rate = 200.0
      room = Hotel::Room.find(5)
      room.rate.must_equal nightly_rate
    end
  end
end

