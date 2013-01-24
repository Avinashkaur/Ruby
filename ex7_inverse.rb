class String
  def to_s
    puts self.swapcase
  end
end
puts "Enter any string:"
new_string = gets.chomp
new_string.to_s