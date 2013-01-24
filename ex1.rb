def traverseString
  pattern = /^[a-z]+$/i
  puts "Enter the string"
  str = gets.chomp.downcase
  char_count = Hash.new(0)
  str.each_char do |c|
    char_count[c] += 1 if c =~ pattern 
  end
  puts char_count
end
traverseString