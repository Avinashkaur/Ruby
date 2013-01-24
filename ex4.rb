def checkPalindrome
  pattern = /q/i
  input_string = ""
  until input_string =~ pattern
    puts "enter a string"
    input_string = gets.chomp
    exit(0) if input_string =~ pattern
    reversed_input = input_string.reverse
    if input_string == reversed_input
      puts "#{input_string} is palindrome"
      exit(0)
    else
      puts "#{input_string} is not palindrome"
    end
  end
end
checkPalindrome