class Array
  attr_accessor :squared_array
  def power(x)
    @@squared_array = []
    self.each { |i|
     @@squared_array << i**x
    }
    print " #{@@squared_array} \n"
  end
end

arr1 = Array.new
arr1 = [1,2,3]
arr1.power(2)
arr1.power(3)
arr1.power(4)


