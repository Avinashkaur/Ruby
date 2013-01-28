def highlight_pattern(user_string, searched_item)
  count = 0
  final_string = user_string.gsub(/#{searched_item}/i) do |s| 
    count += 1
    s = "(" + s + ")" 
  end
  puts "#{final_string}"
  puts "Occurences: #{count}"
end
puts "enter input string"
user_string = gets.chomp
puts "enter item to be searched"
searched_item = gets.chomp
highlight_pattern(user_string, searched_item)