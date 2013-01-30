class Products
  attr_accessor:productname, :imported, :exempted, :price
  @@total = 0
  def initialize
    print "Name of the product: "
    @productname = gets.chomp
    print "Imported? (yes/no): "
    @imported = gets.chomp
    print "Exempted from sales tax? (yes/no): "
    @exempted = gets.chomp
    print "Price: "
    @price = gets.chomp.to_f
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

def display_products(array)
  len = array.length
  total = 0.0
  for i in 0..len-1
    puts "Product Name: #{array[i].productname}"
    puts "Imported: #{array[i].imported}"
    puts "Exempted: #{array[i].exempted}"
    puts "Price: #{array[i].price.round(2)}"
    puts "--------------------------------------------"
    total = array[i].calculate_tax
  end
  puts "Total Bill: #{total}"
end
ans = 'y'
products = []
i = 0
while ans == 'y'
  products[i] = Products.new
  puts "Enter more? (y/n)"
  # puts products[i].productname
  ans = gets.chomp
  i += 1
end
display_products(products)