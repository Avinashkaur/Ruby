def checkPalindrome
  pattern = /q/i
  input_string = ""
  loop do
    puts "enter a string"
    input_string = gets.chomp
    reversed_input = input_string.reverse
    if input_string =~ pattern 
      exit(0)
    elsif input_string == reversed_input
      puts "#{input_string} is palindrome"
    else
      puts "#{input_string} is not a palindrome"
    end
  end
end
checkPalindrome