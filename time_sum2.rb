def validate_time(*time_array)
  pattern = /(0?[0-9]|1[1-9]|2[0-3]):([0-5]?[0-9]):([0-5]?[0-9])/
  len = time_array.size
  flag = 0
  for i in 0..(len-1)
    flag = 1 if !(time_array[i] =~ pattern)
  end
  if (flag == 0)
    time_sum(*time_array)
  else
    puts "Invalid dates"
  end
end
def time_sum(*input)
  len = input.size
  total_seconds, total_minutes, total_hours = 0,0,0
  for i in 0..(len-1) do
    hours,minutes,seconds = input[i].split(":")
    total_seconds += seconds.to_i
    total_minutes += minutes.to_i
    total_hours += hours.to_i
  end
  if(total_seconds > 60)
    total_minutes += total_seconds/60
    total_seconds = total_seconds % 60
  end
  if(total_minutes > 60)
    total_hours += total_minutes / 60
    total_minutes = total_minutes % 60
  end
  puts "The total time is #{total_hours/24} days and #{total_hours%24}:#{total_minutes}:#{total_seconds}"
end
validate_time("23:00:12","22:30:57","4:2:1","9:50:11")