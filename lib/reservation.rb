require 'date'
require_relative 'reservation_date'
require_relative 'room'
require 'pry'

module Hotel
  class Reservation
    attr_reader :reservation_date_range, :qty_of_nights
    def initialize room_num: nil, rate: nil, start_date:, end_date:
      @room_num = nil
      @rate = nil
      @reservation_date_range = Hotel::Reservation_Date.new(start_date, end_date)
      @qty_of_nights = @reservation_date_range.date_range
      #@dates_in_stay = reservation_date_range.dates_to_store
      #move this to system @reservations = [] 
    end
    
    #This may be moved to system
    # def total_cost
    #   total_cost = Hotel::Reservation_Date.reservation_duration * @rate
    #   return total_cost
    # end
    def finds_available_room
    end
    
    def calculates_total_cost
    end
    
    
    #examples:
    # def add_trip(trip)
    #   @trips << trip
    # end
    
    def self.list
    end
    
    def self.find
    end
    
  end
end

#reservation = Hotel::Reservation.new("2001-02-03", "2001-02-05")