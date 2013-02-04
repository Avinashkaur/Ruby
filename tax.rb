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
  @@selected_object = []

  def add_to_cart(value)
    @@selected_object.push(value)
  end

  def display_products
    len = @@selected_object.length
    total = 0.0
    for i in 0..len-1
      puts "Product Name: #{@@selected_object[i].productname}"
      puts "Imported: #{@@selected_object[i].imported}"
      puts "Exempted: #{@@selected_object[i].exempted}"
      puts "Price: #{@@selected_object[i].price.round(2)}"
      puts "-" *30
      total = @@selected_object[i].calculate_tax
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