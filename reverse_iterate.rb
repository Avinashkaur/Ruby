class Array
  def reverse_iterate
    new_array = self.reverse
    new_array.each { |element| yield(element)}
    print "\n"
  end
end
[2,45,6,82].reverse_iterate{ |i| print "#{i} "}