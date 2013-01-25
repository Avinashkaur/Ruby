class Array
  def traversed_array
    new_hash = Hash.new { |hash, key| hash[key] = [] }
    for i in self
      i_length = i.to_s.length
      new_hash[i_length].push(i)
    end
    puts new_hash
  end
end
[1234,'abc','mno',1890, 12, 'vinsol','monkey'].traversed_array