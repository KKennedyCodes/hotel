require 'date'

module Hotel
  class Reservation_Date #rename to ReservationDate
    
    attr_reader :start_date, :end_date 
    
    def initialize start_date, end_date
      @start_date = check_date_validity(check_date_formatting(start_date))
      @end_date = check_date_validity(check_date_formatting(end_date))
    end
    
    def check_date_formatting(date)
      date_formatting = /\d{3}\-\d\d\-\d\d/
      formatting = date_formatting.match(date)
      unless formatting != nil
        raise ArgumentError.new("Invalid Date Formatting, Should Be Formatted as: YYYY-MM-DD")
      end
      return date
    end
    
    def check_date_validity(date)
      date_check = Date._parse(date)
      verify = Date.valid_date?(date_check[:year], date_check[:mon], date_check[:mday])
      unless verify != false
        raise ArgumentError.new("Invalid Date")
      end
      return Date.parse(date)
    end
    
    def date_range
      if @start_date > @end_date
        raise ArgumentError.new("Invalid Date Range")
      else
        duration = (@end_date - @start_date).to_i
        return duration
      end
    end
    
  end
end

