def factorial(upper_limit)
  begin
    if upper_limit < 0
      raise
    elsif (upper_limit == 0)
      fact = 1
    else 
      fact = (1..upper_limit).inject { |prod,i| prod *= i }
    end
    puts "Factorial of #{upper_limit} is #{fact}"
  rescue
    puts "Negative number entered..."
  end
end
puts "enter the upper limit:"
upper_limit = gets.chomp
factorial(upper_limit.to_i)