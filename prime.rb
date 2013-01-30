require 'prime'
def find_prime(n)
  arr = [2]
  puts "Printing prime numbers"
  3.step(n,2) do |i|
    arr.push(i) if Prime.prime?(i) 
  end
  puts arr
end
puts "For printing prime numbers upto n, enter the value of n"
num = gets.chomp.to_i
find_prime(num)