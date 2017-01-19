# 1) Read file line by line (gets)

puts "Read file line by line (gets)"

File.open("testfile1") do |file|
  while line = file.gets
    puts line
  end
end

# 2) Read file byte by byte
puts "Read file byte by byte"

File.open("testfile1") do |file|
  file.each_byte.with_index do |ch, index|
    print "#{ch.chr}:#{ch} "
    break if index > 10
  end
end

puts "\n"

# 3) Read file line by line (each_line)
puts "Read file line by line (each_line)"

puts "Break lines at the end of each line i.e. normally"

File.open("testfile1") do |file|
  # Break each line at the letter 'e'
  file.each_line {|line| puts "Got #{line.dump}"}
end

puts "Break lines at the letter e"

File.open("testfile1") do |file|
  # Break each line at the letter 'e'
  file.each_line("e") {|line| puts "Got #{line.dump}"}
end

# If you combine the idea of an iterator with the autoclosing block feature, you get IO.foreach.
# This method takes the name of an I/O source, opens it for reading, calls the iterator once for
# every line in the file, and then closes the file automatically:

puts "Read file line by line (foreach)"

IO.foreach("testfile1") {|line| puts line}

# read entire file into a string
str = IO.read("testfile1")
puts str.length # => 85 
puts str[0, 30] # => "testfile1\nThis is line one\nThi"

# read entire file into an array
arr = IO.readlines("testfile1")
puts arr.length # => 6
puts arr[1] # => "This is line one\n"
