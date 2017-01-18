a = 1

while (a < 5)
  a += 1
end

puts a # => 5

until a < 1
  a -= 1
end

puts a # => 0

# As with if and unless, you can use both of the loops as statement modifiers:
a = 1

a *= 2 while a < 100

puts a # => 128

a -= 10 until a < 100

puts a # => 98

# range flip-flop example
file = File.open("ordinal.txt")
while line = file.gets
  puts(line) if line =~ /third/ .. line =~ /fifth/   # => third, fourth, fifth
end

puts "\r\n"

# Using Perl-like syntax.
# This uses some behind-the-scenes magic behavior: gets assigns the last line read to the
# global variable $_, the ~ operator does a regular expression match against $_, and
# print with no arguments prints $_. This kind of code is falling out of fashion in the
# Ruby community and may end up being removed from the language.
file = File.open("ordinal.txt")
while file.gets
  print if ~/third/ .. ~/fifth/                      # => third, fourth, fifth
end

puts "\r\n"

# The start and end of a range used in a boolean expression can themselves be expressions.
# These are evaluated each time the overall boolean expression is evaluated. For example, the
# following code uses the fact that the variable $. contains the current input line number to
# display line numbers 1 through 3 as well as those between a match of /eig/ and /nin/:

File.foreach("ordinal.txt") do |line|
  if (($. == 1) || line =~ /eig/) .. (($. == 3) || line =~ /nin/)
    print line                                      # => first, second, third, eigth, ninth
  end
end

puts "\r\n"
# Prints all entries from eight as it doesn't "switch off"
File.foreach("ordinal.txt") do |line|
  if (($. == 1) || line =~ /eig/) .. ($. == 3)     # => first, second, third, eigth, ninth, tenth
    print line
  end
end

# You’ll come across a wrinkle when you use while and until as statement modifiers. If the
# statement they are modifying is a begin...end block, the code in the block will always
# execute at least one time, regardless of the value of the boolean expression

print "Hello\n" while false  # => Does not output

begin
  print "Goodbye\n"          # => Goodbye
end while false
