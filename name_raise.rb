class Name
  attr_accessor:firstname, :lastname
  def initialize(fname,lname)
    begin
      if (fname.strip.empty?)
        raise "First Name cannot be left blank"
      elsif (lname.strip.empty?)
        raise "Last Name cannot be left blank"
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
puts "Enter your first name"
fname = gets.chomp
puts "Enter your last name"
lname = gets.chomp
Name.new(fname, lname)