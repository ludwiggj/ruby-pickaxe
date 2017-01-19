class Example
end

# Note the "w", which opens the file for writing
File.open("output.txt", "w") do |file|
  file.puts "Hello"
  file.puts "1 + 2 = #{1+2}"

  # The nil object will print as the empty string
  file.puts nil

  # An array passed to puts will be written as if each of its elements in turn were passed separately to puts.
  file.puts %w("This", "is", "a", "test")

  file.puts Example.new
end

# Now read the file in and print its contents to STDOUT
puts File.read("output.txt")

# How do you get the binary data into a string?
# The three common ways are to use a literal, poke it in byte by byte, or use Array#pack:2
s1 = "\001\002\003"       # => "\u0001\u0002\u0003"

s2 = "" << 1 << 2 << 3    # => "\u0001\u0002\u0003"

s3 = [1, 2, 3 ].pack("c*") # => "\x01\x02\x03"

# << operator can be used to append an object to an output IO stream (though not idiomatic style)
endl = "\n"
STDOUT << 99 << " red balloons" << endl

# There are actually some good reasons for using the << operator. Because other classes (such as String and Array) also implement a <<
# operator with similar semantics, you can quite often write code that appends to something using << without caring whether it is
# added to an array, a file, or a string. This kind of flexibility also makes unit testing easy e.g. duck typing.
