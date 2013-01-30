class Array
  def reverse_iterate
    len = self.length
    i = len
    while (i>=0)
      yield(self[i])
      i -= 1
    end
    print "\n"
  end
end
[2,45,6,82].reverse_iterate{ |i| print "#{i} "}