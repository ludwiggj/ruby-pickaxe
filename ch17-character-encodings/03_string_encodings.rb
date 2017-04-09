# encoding: utf-8

# String literals are always encoded using the encoding of the source file that contains them,
# regardless of the content of the string:
def show_encoding(str)
  puts "'#{str}' (size #{str.size}) is #{str.encoding.name}"
end

show_encoding "cat" # latin 'c', 'a', 't'

show_encoding "∂og" # greek delta, latin 'o', 'g'

# Symbols and regular expression literals that contain only 7-bit characters are encoded using
# US-ASCII. Otherwise, they will have the encoding of the file that contains them.

def show_encoding_2(str)
  puts "#{str.inspect} is #{str.encoding.name}"
end

show_encoding :cat
show_encoding :∂og

show_encoding_2 :cat
show_encoding_2 :∂og

show_encoding_2 /cat/
show_encoding_2 /∂og/
