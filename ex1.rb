def traverse
 puts "Enter the string"
 str = gets.chomp
 char_count = Hash.new(0)
 str.each_char do |c|
   char_count[c] += 1
   puts "#{c} : #{char_count}"
 end
end
traverse
