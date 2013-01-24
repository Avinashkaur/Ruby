class Vehicle
  attr_accessor :price, :name
  def initialize(name, price)
    @name = name
    @price = price
  end
end

class Bike < Vehicle
  attr_accessor :dealer
  def initialize(name, price, dealer)
    @name = name
    @price = price
    @dealer = dealer
  end
  def show
    puts "Vehicle Name: #{@name} Price: #{@price} Dealer: #{@dealer}"
  end
end

bike1 = Bike.new("Karizma",50000,"Mr.Kapil")
bike1.show
bike1.price = 40000
bike1.show