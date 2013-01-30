require "date"
require "time"
def validate_time
  pattern = /[0-2]?[0-9]:[0-9]?[0-9]:[0-9]?[0-9]/
  puts "Enter time1: "
  time1 = gets.chomp
  puts "Enter time2: "
  time2 = gets.chomp

  if (time1 =~ pattern && time2 =~ pattern)
    time_sum(time1, time2)
  else
    puts "Invalid Argument! Correct Arguments hh:mm:ss hh:mm:ss"
  end
end
def time_sum(time1, time2)
  first_time = DateTime.strptime(time1, "%H:%M:%S")
  second_time = DateTime.strptime(time2, "%H:%M:%S")
  sum = (second_time.hour + second_time.min/60.00 + second_time.sec/3600.00)/24
  new_time = first_time + sum
  difference = new_time.day - first_time.day
  puts new_time.strftime("Total Time is #{difference} days %H:%M:%S")
end
validate_time