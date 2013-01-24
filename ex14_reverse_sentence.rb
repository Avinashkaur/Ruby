def reverse_sentence
  puts "Enter string:"
  sentence = gets.chomp
  words = sentence.split
  arr = []
  words.each do |i|
    arr.push(i)
  end
  print arr.reverse.join(" ")
  puts ""
end
reverse_sentence