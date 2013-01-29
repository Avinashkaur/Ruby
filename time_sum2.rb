require "date"
require "time"

def time_sum(*input)
  total_args = input.size
  first_time = DateTime.strptime(input[0], "%H:%M:%S")
  total_time = first_time
  day_sum = 0
  for n in 1..(total_args-1) do
    next_time = DateTime.strptime(input[n],"%H:%M:%S")
    day_sum += (next_time.hour + next_time.min/60.0 + next_time.sec/3600.0)/24
  end
  total_time += day_sum
  difference = total_time.day - first_time.day
  puts total_time.strftime("#{difference} days %H:%M:%S")
end
time_sum("23:00:12","22:30:57","4:2:1","9:50:11")