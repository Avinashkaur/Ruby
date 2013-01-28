def highlight_pattern(user_string, searched_item)
  puts user_string.gsub(/#{searched_item}/i, '(\0)')
  puts "Occurences:  #{user_string.scan(/#{searched_item}/i).length}"
end
puts "enter input string"
user_string = gets.chomp
puts "enter item to be searched"
searched_item = gets.chomp
highlight_pattern(user_string, searched_item)