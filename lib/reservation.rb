require 'date'
require_relative 'reservation_date'
require_relative 'room'
require 'pry'

module Hotel
  class Reservation
    attr_reader :reservation_date_range, :qty_of_nights, :rate, :room_num, :cost
    def initialize room_num: nil, rate: 200, start_date:, end_date:
      @room_num = room_num
      @rate = rate
      @reservation_date_range = Hotel::Reservation_Date.new(start_date, end_date)
      @qty_of_nights = @reservation_date_range.date_range
      @cost = total_cost
    end
    
    def total_cost
      total_cost = @qty_of_nights * @rate
      return total_cost
    end
    
    def self.all
      return @reservations
    end
    
    # def self.find(date_range_object)
    #   reservation_list = @reservations.all
    #   reservation_list.each do |reservation|
    #     if reservation.reservation_date_range == date_range_object
    #       return reservation
    #     end
    #   end
    #   return nil
    # end 
    
    
  end
end

#reservation = Hotel::Reservation.new("2001-02-03", "2001-02-05")