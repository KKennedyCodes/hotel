require_relative 'room.rb'
require_relative 'reservation.rb'
require_relative 'reservation_date.rb'

module Hotel
  class System
    attr_reader #:room_num, :start_date, :end_date, :rate
    
    def initialize #:room_num, :start_date, :end_date, :rate
      # @room_num = room_num
      # @start_date = start_date
      # @end_date = end_date
      # @rate = rate
    end
    
    def room_list
      return Hotel::Room.all
    end
    
  end
end