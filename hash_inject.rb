def traversed_array(array)
    new_hash = Hash.new { |hash, key| hash[key] = [] }
    for i in array
      i_length = i.to_s.length
      new_hash[i_length].push(i)
    end
  new_hash
end
def generate_hash(array)
  generated_hash = traversed_array(array)
  user_hash = {}
  user_hash['even'] = []
  user_hash['odd'] = []
  hash = generated_hash.inject(user_hash) do |user_hash, element|
    if element[0].even?
      user_hash['even'] << element[1]
    else
      user_hash['odd'] << element[1]
    end
    user_hash
  end
  puts hash
end
generate_hash([1234,'abc','mno',1890, 12, 'vinsol','monkey'])