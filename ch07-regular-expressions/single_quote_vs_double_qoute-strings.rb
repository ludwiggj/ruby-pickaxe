# Note that in the literal form of the string whatever is between single or double quotes is
# evaluated as a string object, which is an instance of the Ruby string class.

# The essential difference between the two literal forms of strings (single and double quoted)
# is that:

# Double-quoted strings support both escape sequences and string interpolation.
puts "\n" # Interpreted as a new line
puts "The time is #{Time.now}"

# Single-quoted strings do not support escape sequences and do not support string interpolation.
puts '\n' # Not interpreted as a new line; displays the actual escape sequence.
puts 'The time is #{Time.now}'

# Actually, there are 2 characters that need to escaped in single quotes
puts '\\' # => backslash
puts '\'' # => single quote  

# Actually behaviour around backslash is pretty weird...
puts "\ guitarist"                          # Backslash disappears
puts "\guitarist"                           # Backslash disappears
puts "\\guitarist"                          # Single backslash
puts '\ guitarist'                          # Single backslash
puts '\guitarist'                           # Single backslash
puts '\\guitarist'                          # Single backslash

# Use single quoted literals unless you need interpolation or escaping of sequences.
