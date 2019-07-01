require 'active_support'
require 'active_support/core_ext'

class RecurringMoment
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def match(date)
    current = @start

    while current < date 
      # if current == date
      #   return true
      # end

      if @period == 'weekly'
        current = current.advance(weeks: @interval)
        if current == date
          return true
        end
      elsif @period == 'monthly'
        current = current.advance(months: @interval)
        if current == date 
          return true
        
        end
      elsif @period == 'daily'
        current = current.advance(days: @interval)
        if current == date
          return true
        end
      end
    end

    return false
  end
end
