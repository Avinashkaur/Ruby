def checkPalindrome
  pattern = /q/i
  input_string = ""
  until input_string =~ pattern
    puts "enter a string"
    input_string = gets.chomp
    exit(0) if input_string =~ pattern
    reversed_input = input_string.reverse
    puts "#{input_string} is palindrome" if input_string == reversed_input
    puts "#{input_string} is not palindrome" if input_string != reversed_input
  end
end
checkPalindrome