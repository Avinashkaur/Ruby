def replaceVowel
  pattern = /[aeiou]/
  puts "Enter a string:"
  str = gets.chomp
  puts str.gsub(pattern,'*')
end
replaceVowel