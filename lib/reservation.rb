require 'date'
require_relative 'reservation_date'
require_relative 'room'

module Hotel
  class Reservation
    attr_reader :start_date, :end_date
    def initialize start_date, end_date
      @room_num = nil
      @rate = nil
      reservation_dates = Hotel::Reservation_Date(start_date, end_date)
      @qty_of_nights = reservation_dates.date_range
      @dates_in_stay = reservation_dates.dates_to_store
    end
    
    #This may be moved to system
    # def total_cost
    #   total_cost = Hotel::Reservation_Date.reservation_duration * @rate
    #   return total_cost
    # end
    
    def add_reservation
      # @reservations << Hotel::Reservation.new#(@room_num, @start_date, @end_date, @rate)
    end
    
    def self.list
    end
    
    def self.find
    end
    
  end
end