def reverse_sentence
  puts "Enter string:"
  sentence = gets.chomp
  words = sentence.split
  print words.reverse.join(" ")
  print "\n"
end
reverse_sentence