# You can create arbitrary Unicode characters in strings and regular expressions using the \u
# escape. This has two forms:
#
# \uxxxx lets you encode a character using four hex digits

puts "Greek pi: \u03c0" # => "Greek pi: π"

# the delimited form \u{x... x... x...} lets you specify a variable number of characters, each with a
# variable number of hex digits:

puts "Greek pi: \u{3c0}"         # => "Greek pi: π"
puts "Greek \u{70 69 3a 20 3c0}" # => "Greek pi: π"

# Literals containing \u will always be encoded UTF-8, regardless of the source file encoding.

# The String#bytes method is a convenient way to inspect the bytes in a string object. Notice
# that in the following code, the 16-bit codepoint is converted to a two-byte UTF-8 encoding:

puts "pi: \u03c0".bytes # => [112, 105, 58, 32, 207, 128]
