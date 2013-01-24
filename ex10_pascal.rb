def fact(n)
  prod = 1
  for i in 1..n
    prod *= i
  end
  prod
end

def pascal_triangle_row(n) 
  for k in 1..n
    yield(k)
    puts ""
  end
end

print "enter number: "
num = gets.chomp

pascal_triangle_row(Integer(num)) do |i|
  for j in 0..i
    print (fact(i)/(fact(j)*fact(i-j)))
    print " "
  end
end