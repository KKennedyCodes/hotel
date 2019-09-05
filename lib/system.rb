require_relative 'room.rb'
require_relative 'reservation.rb'
require_relative 'reservation_date.rb'

module Hotel
  class System
    attr_reader :rooms, :reservations
    
    def initialize# :room_num, :start_date, :end_date, :rate
      @rooms = Hotel::Room.all
      @reservations = Array.new
    end
    
    # def pre-reservation_validation
    #   #search through current reservations - find available room
    # end
    
    # def add_reservation(new_reservation)
    #   reservations << new_reservation
    # end
    # def room_list
    #   return Hotel::Room.all
    # end
    
  end
end