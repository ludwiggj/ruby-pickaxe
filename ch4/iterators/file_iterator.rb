f = File.open("../misc/testfile")
f.each do |line|
  puts "The line is: #{line}"
end
f.close

f = File.open("../misc/testfile")
f.each.with_index do |line, index|
  puts "Line #{index} is: #{line}"
end
f.close
