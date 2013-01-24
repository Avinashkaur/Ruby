class Customer
  attr_accessor :name, :account_no, :balance
  @@counter = 0
  
  def initialize(cust_name)
    @name = cust_name
    @account_no = @@counter
    @balance = 1000
    @@counter += 1
  end

  def deposit
    puts "Enter amount to deposit for #{@name}"
    get_amt = gets.chomp.to_i
    @balance += get_amt
    puts "New amount: #{@balance}"
  end

  def withdraw
    puts "Enter amount to withdraw"
    user_amount = gets.chomp.to_i
    if user_amount < @balance
      @balance -= user_amount
      puts "Successfully withdrawn! Your Current balance is #{@balance}"
    else 
      puts "Sorry! Cannot withdraw amount. Your balance is #{@balance}"
    end
  end
end

  customer1 = Customer.new("Mary")
  customer1.deposit
  customer1.withdraw
  puts "#{customer1.name}, your account no is: #{customer1.account_no} Your Balance is: #{customer1.balance} "

  customer2 = Customer.new("Steve")
  customer2.deposit
  customer2.withdraw
  puts "#{customer2.name}, your account no is: #{customer2.account_no} Your Balance is: #{customer2.balance} "