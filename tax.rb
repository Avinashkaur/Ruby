class Products
  attr_accessor:productname, :imported, :exempted, :price
  @@total = 0
  def initialize(productname,imported,exempted,price)
    @productname = productname
    @imported = imported
    @exempted = exempted
    @price = price
    importduty,salestax = 0.0,0.0
    importduty = import_duty(@price) if @imported =~ /yes/i
    salestax = sales_tax(@price) if @exempted =~ /no/i
    @price += importduty + salestax
  end
  def calculate_tax
    @@total += @price.to_i.round
  end
  def import_duty(itemprice)
    0.05*itemprice.to_f
  end
  def sales_tax(itemprice)
    0.1*itemprice.to_f
  end
end

class Productlist
  attr_accessor  :selected_object

  def initialize
    @selected_object = []
  end

  def add_to_cart(value)
    @selected_object.push(value)
  end

  def display_products
    total = 0.0
    @selected_object.each do |product|
      puts "Product Name: #{product.productname}"
      puts "Imported: #{product.imported}"
      puts "Exempted: #{product.exempted}"
      puts "Price: #{product.price.round(2)}"
      puts "-" *30
      total = product.calculate_tax
    end
    puts "Total Bill: #{total}"
  end
end

ans = 'y'
cart = Productlist.new
i = 0
while (ans == 'y' || ans == 'Y')
  print "Name of the product: "
  productname = gets.chomp
  print "Imported? (yes/no): "
  imported = gets.chomp
  print "Exempted from sales tax? (yes/no): "
  exempted = gets.chomp
  print "Price: "
  price = gets.chomp.to_f
  product = Products.new(productname, imported, exempted, price)
  cart.add_to_cart(product)
  puts "Enter more? (y/n)"
  ans = gets.chomp
  i += 1
end
cart.display_products