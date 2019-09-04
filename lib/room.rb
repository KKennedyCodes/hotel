module Hotel
  class Room
    attr_reader :room_num, :rate
    
    def initialize room_num, rate
      @room_num = room_num
      unless rate.to_f > 0
        raise ArgumentError.new("Invalid Room Rate - Must Be a Postive Value Greater Than Zero. I got #{rate}")
      end
      @rate = rate.to_f
      
    end
    
    def self.all
      @rooms = []
      room_num = 1
      rate = 200
      20.times do
        @rooms << Hotel::Room.new(room_num, rate)
        room_num +=1
      end
      return @rooms
    end
  end
end