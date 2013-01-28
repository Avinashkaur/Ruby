require 'prime'
def find_prime(n)
  arr = []
  puts "Printing prime numbers"
  puts 2
  (1..n).step(2) do |i|
    arr.push(i) if Prime.prime?(i) 
  end
  puts arr
end
puts "For printing prime numbers upto n, enter the value of n"
num = gets.chomp.to_i

find_prime(num)