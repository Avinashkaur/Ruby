def generateFibonacci(limit)
  first_num, second_num = 0,1
  puts first_num
  yield first_num, second_num, limit
end
generateFibonacci(1000) do |i,j,limit|
  while j <= limit do
    i,j = j,i+j
    puts i
  end
end