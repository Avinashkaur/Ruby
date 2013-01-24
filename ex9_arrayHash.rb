class Array
  attr_accessor :user_array, :new_hash
  def initialize(user_array)
    @user_array = user_array
    @new_hash = Hash.new(0)
  end
  def traversed_array
    for i in @user_array
      i_length = i.to_s.length
      @new_hash[i_length] = @new_hash.fetch(i_length,[]) unless @new_hash.has_key?(i_length)
      @new_hash[i_length].push(i)
    end
    puts @new_hash
  end
end
arr = Array.new([1234,'abc','mno',1890, 12, 'vinsol','monkey'])
arr.traversed_array