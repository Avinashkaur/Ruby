require 'prime'
def find_prime(n)
  arr = []
  puts "Printing prime numbers"
  arr.push(2)
  3.step(n,2) do |i|
    if Prime.prime?(i) 
      arr.push(i) 
    end
  end
  puts arr
end
puts "For printing prime numbers upto n, enter the value of n"
num = gets.chomp.to_i
find_prime(num)