require "date"
require "time"
def validate_time
  pattern = /[0-2]?[0-9]:[0-9]?[0-9]:[0-9]?[0-9]/
  puts "Enter time1: "
  time1 = gets.chomp
  puts "Enter time2: "
  time2 = gets.chomp
  begin
    if (time1 =~ pattern && time2 =~ pattern)
      time_sum(time1, time2)
    else
      puts "Invalid input! Correct input hh:mm:ss"
    end
  rescue 
    puts "Invalid date entered!"
  end
end
def time_sum(*time_array)
  len = time_array.size
  total_seconds, total_minutes, total_hours = 0,0,0
  for i in 0..(len-1) do
    hours,minutes,seconds = time_array[i].split(":")
    total_seconds += seconds.to_i + (minutes.to_i)*60 + (hours.to_i)*3600
  end
  total_minutes_temp= total_seconds/60
  total_hours = total_minutes_temp/60
  total_minutes = total_minutes_temp%60
  total_seconds = total_seconds%60
  puts "#{total_hours/24} days #{total_hours%24} hours #{total_minutes} minutes #{total_seconds} seconds"
end
validate_time