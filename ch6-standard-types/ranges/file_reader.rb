some_file = File.open("example_file.txt", "r")
some_file.each do |line|
  puts line if line=~/start/ ... line=~/end/
end
some_file.close
