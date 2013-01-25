def factorial(upper_limit)
  fact = (1..upper_limit).inject do |prod,i| 
    prod *= i
    prod
  end
  puts "Factorial of #{upper_limit} is #{fact}"
end
puts "enter the upper limit:"
upper_limit = gets.chomp
factorial(upper_limit.to_i)