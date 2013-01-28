def char_count(input_string)
  lower_count, upper_count, digit_count, special_count = 0,0,0,0
  input_string.each_char do |character|
    if ('a'..'z').include?(character)  
      lower_count += 1 
    elsif ('A'..'Z').include?(character) 
      upper_count += 1 
    elsif ('0'..'9').include?(character)  
      digit_count += 1 
    else special_count += 1
    end
  end
  puts "Lowercase characters: #{lower_count} Uppercase characters: #{upper_count} digits: #{digit_count} special characters: #{special_count} "
end

puts "enter a string:"
input_string = gets.chomp
char_count(input_string.gsub(/\s/, ""))