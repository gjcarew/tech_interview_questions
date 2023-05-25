# Make an array with the days of the week (abbreviated)
# inputs are month and year (array of strings) as numbers
# Make a date object out of the inputs
# Sequentially fill the array starting on the starting day index
# Stop on the last day of the month
# TODO
# Right align single digits
# Center Month and Year over printed calendar
# Output is the calendar example

require 'date'

def print_calendar(inputs)
  starting_day = Date.new(inputs[1].to_i, inputs[0].to_i, 1)
  ending_day = Date.new(inputs[1].to_i, inputs[0].to_i, -1)
  date_range = [*starting_day..ending_day]
  calendar = [%w[Su Mo Tu We Th Fr Sa]]
  week = Array.new(7, '  ')
  
  date_range.each do |day|
    week[day.wday] = day.day.to_s.rjust(2)
    if day.saturday? || day == date_range.last
      calendar << week
      week = Array.new(7, '  ')
    end
  end
  puts "#{starting_day.strftime('%B')} #{starting_day.year}".center(20)
  calendar.map { |week| puts week.join(' ') }
end

print_calendar(ARGV)