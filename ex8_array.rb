class Array
  def power(x)
    new_array = []
    self.each do |i|
      new_array << i**x
    end
    print " #{new_array} \n"
  end
end
[3,4,5].power(2)
[1,2,2].power(3)
[1,2,2].power(4)