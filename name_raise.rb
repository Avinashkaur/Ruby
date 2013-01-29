class Name
  attr_accessor:firstname, :lastname
  def initialize(fname,lname)
    begin
      if (fname.empty? || lname.empty?)
        raise "Blank Name entered"
      elsif (fname != fname.capitalize)
        raise "First name should be capitalized"
      else
        @firstname = fname
        @lastname = lname
        puts "Name is :#{@firstname} #{@lastname}"
      end
    rescue Exception => e
      puts e.message
    end
  end
end
puts "Enter your full name"
name = gets.chomp
fname = name.split(" ")[0]
lname = name.split(" ")[1]
Name.new(fname.to_s, lname.to_s)