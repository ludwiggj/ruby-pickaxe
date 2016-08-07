# Because pattern matching returns nil when it fails and because nil is
# equivalent to false in a boolean context, you can use the result of a
# pattern match as a condition in statements such as if and while.

str = 'cat and dog'

if str =~ /cat/
  puts 'There\'s a cat here somewhere'
end

# The following code prints lines in testfile that have the string on in them:
File.foreach('testfile.txt').with_index do |line, index|
  puts "#{index}: #{line}" if line =~ /on/
end

# You can test to see whether a pattern does not match a string using !~:

File.foreach('testfile.txt').with_index do |line, index|
  puts "#{index}: #{line}" if line !~ /on/
end
