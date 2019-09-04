require 'date'
require_relative 'reservation_date'

module Hotel
  class Reservation
    attr_reader :room_num, :start_date, :end_date, :rate
    def initialize room_num, start_date, end_date, rate
      @room_num = room_num
      @rate = rate
      @start_date
      @end_date
      @log = []
    end
    
    #This may be moved to system
    # def total_cost
    #   total_cost = Hotel::Reservation_Date.reservation_duration * @rate
    #   return total_cost
    # end
    
    def add_reservation
      @reservations << Hotel::Reservation.new(@room_num, @start_date, @end_date, @rate)
    end
    
    def self.list
    end
    
    def self.find
    end
    
  end
end