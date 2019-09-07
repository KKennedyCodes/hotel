require_relative 'room.rb'
require_relative 'reservation.rb'
require_relative 'reservation_date.rb'

module Hotel
  class System
    attr_reader :rooms, :reservations, :start_date, :end_date
    
    def initialize room_num: nil, start_date: nil, end_date: nil, rate: nil
      @rooms = Hotel::Room.all
      @reservations = Array.new
      @new_reservation = nil #temporary varialbe for booking
    end
    
    def room_list
      return Hotel::Room.all
    end
    
    def create_reservation(room_num: nil, start_date: start_date, end_date: end_date, rate: nil)
      #@new_reservation = Hotel::Reservation.new(start_date: start_date, end_date: end_date)
      Hotel::Reservation.new(start_date: start_date, end_date: end_date)
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
    def self.all
      return @reservations
    end
    
    # def find_available(date)
    #   rooms_available = []
    #   @reservations.each do |reservation|
    #     while start_date < end_date
    #       if reservation.start_date == date
    #         rooms_available << reservation
    #       end
    #       start_date += 1
    #     end
    #     return rooms_available
    #   end
    #end
    
    # def find_booked(date)
    #   rooms_booked = []
    #   @reservations.each do |reservation|
    #     while reservation.reservation_date_range.start_date < reservation.reservation_date_range.end_date
    #       if reservation.reservation_date_range.start_date == date
    #         rooms_available << reservation
    #       end
    #       reservation_date_range.start_date += 1
    #     end
    #     return rooms_booked
    #   end
    # end
  end
end
