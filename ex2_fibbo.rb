def fib(n)
  a,b = 0,1
  n.times do
    yield a
    a,b = b, a+b
  end
end
fib(1000) { |i| print "number: #{i}\n" }