require_relative 'room.rb'
require_relative 'reservation.rb'
require_relative 'reservation_date.rb'

module Hotel
  class System
    attr_reader :rooms, :reservations, :start_date, :end_date
    
    def initialize #:room_num = nil, :start_date = nil, :end_date = nil, :rate = nil
      @rooms = Hotel::Room.all
      @reservations = Array.new
      @new_reservation = nil #temporary varialbe for booking
    end
    
    # def add_reservation(new_reservation)
    #   reservations << new_reservation
    # end
    
    # def room_list
    #   return Hotel::Room.all
    # end
    def create_reservation(start_date, end_date)
      @new_reservation = Hotel::Reservation.new(start_date: start_date, end_date: end_date)
    end
    
    def add_reservation(new_reservation)
      @reservations << new_reservation
    end
    
    # def reservation_validation
    #   search through current reservations - find available room
    # end
    
    # def reservation_check_all
    #   if @reservations.length = 0
    #     raise ArgumentError.new("No Reservations in the System")
    #   end
    
    #   i = 0
    #   while i < @reservations.length
    #   end
    
    
  end
end