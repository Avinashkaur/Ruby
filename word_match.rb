def match_input(input_string)
  array = ["testingg123", "testing23542", "asdtest", "sazwqa", "testingWorld","yourworld","vinsolNet", "employeesName"]
  result = []
  pattern = /^(#{input_string})\w*$/i
  array.select { |i| result.push(i) if i =~ pattern }
  result.size == 0 ? (print "No results found!") : (print result)
  print "\n"
end
ans = 'y'
while (ans == 'y')
  puts "enter the input string: "
  string = gets.chomp
  puts "Matching words: "
  match_input(string)
  puts "Find more words?(y/n)"
  ans = gets.chomp
end