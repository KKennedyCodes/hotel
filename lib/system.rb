require_relative 'room.rb'
require_relative 'reservation.rb'
require_relative 'reservation_date.rb'

module Hotel
  class System
    attr_reader #:room_num, :start_date, :end_date#, :rate
    
    def initialize #:room_num, :start_date, :end_date#, :rate
      # @room_num = room_num
      # dates = Hotel::Reservation_Date(start_date, end_date)
      # @qty_of_nights()
      # @included_dates
    end
    
    def room_list
      return Hotel::Room.all
    end
    
  end
end