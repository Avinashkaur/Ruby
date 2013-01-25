def replace_vowel
  pattern = /[aeiou]/
  puts "Enter a string:"
  str = gets.chomp
  puts str.gsub(pattern,'*')
end
replace_vowel