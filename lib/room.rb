module Hotel
  class Room
    attr_reader :room_num, :rate, :RATE
    
    RATE = 200.0
    
    def initialize room_num = nil
      unless room_num.to_i > 0
        raise ArgumentError.new("Invalid Room Number - Must Be 1-20. I got #{room_num}")
      end
      @room_num = room_num
      @rate = RATE
    end
    
    def self.all
      @rooms = []
      room_num = 1
      20.times do
        @rooms << Hotel::Room.new(room_num)
        room_num +=1
      end
      return @rooms
    end
    
    def self.find(room_num)
      return @rooms.find { |room| room.room_num == room_num}
    end
    
  end
end