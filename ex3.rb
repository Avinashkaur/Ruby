def replaceVowel
  pattern = /[aeiou]/
  puts "Enter a string:"
  str = gets.chomp
  str.each_char do |i|
    i = '*' if i =~ pattern  
    print i 
  end
end
replaceVowel