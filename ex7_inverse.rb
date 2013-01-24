class Inverse
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  def to_s
    @name = name.swapcase
    puts @name
  end
end
puts "Enter any string:"
new_string = gets.chomp
name1 = Inverse.new(new_string)
name1.to_s