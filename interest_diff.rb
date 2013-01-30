class Interest
  attr_accessor :principal, :time
  @@rate = 0.1
  def initialize(principal,time)
    @principal = principal
    @time = time
  end
  def simple_interest
    interest = @principal*@@rate*@time
    @principal+interest
  end
  def compound_interest
    amt = @principal*(1+@@rate)**@time
    amt.round(4)
  end
  def difference
    (compound_interest - simple_interest).round(3)
  end
end
puts "Enter principal:"
principal = gets.chomp.to_i
puts "Enter time:"
time = gets.chomp.to_i
new_amt = Interest.new(principal,time)
new_amt.simple_interest
new_amt.compound_interest
puts "Difference in Amount: #{new_amt.difference}"