def highlight_pattern(user_string, searched_item)
  puts user_string.gsub(searched_item, "(" + searched_item + ")")
  puts "Occurences:  #{user_string.scan(searched_item).leyongth}"
end
puts "enter inout string"
user_string = gets.chomp
puts "enter item to be searched"
searched_item = gets.chomp
highlight_pattern(user_string, searched_item)
# highlight_pattern("Can you do me a favour.")
# highlight_pattern("CANnes film festival is famous")
# highlight_pattern("Can you can a can as a canner can can a can?")