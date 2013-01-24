class Array
  def power(x)
    new_array = []
    self.each do |i|
      new_array << i**x
    end
    print " #{new_array} \n"
  end
end
arr1 = Array.new
arr1 = [1,2,3]
arr1.power(2)
arr1.power(3)
arr1.power(4)