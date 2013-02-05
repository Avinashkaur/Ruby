def validate_time(*time_array)
  pattern = /^(0?[0-9]|1[1-9]|2[0-3]):([0-5]?[0-9]):([0-5]?[0-9])$/
  time_array.each do |object|
    exit(0) if !(object =~ pattern)
  end
  time_sum(*time_array)
end
def time_sum(*input)
  total_seconds, total_minutes, total_hours = 0, 0, 0
  input.each do |new_time|
    hours,minutes,seconds = new_time.split(":")
    total_seconds += seconds.to_i + (minutes.to_i)*60 + (hours.to_i)*3600
  end
  total_minutes_temp = total_seconds/60
  total_hours = total_minutes_temp/60
  total_minutes = total_minutes_temp%60
  total_seconds = total_seconds%60
  puts "#{total_hours/24} days #{total_hours%24} hours #{total_minutes} minutes #{total_seconds} seconds"
end
validate_time("22:00:12","22:30:57","4:2:1","9:50:11")