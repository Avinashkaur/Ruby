def highlight_pattern(user_string)
  counter = 0
  puts user_string.gsub(/(?<pattern>can)/i, '(\k<pattern>)')
  puts "Occurences:  #{user_string.scan(/(?<pattern>can)/i).length}"
end
highlight_pattern("Can you do me a favour.")
highlight_pattern("CANnes film festival is famous")
highlight_pattern("Can you can a can as a canner can can a can?")