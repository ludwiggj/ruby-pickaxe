# C, or Java, or ...
a = 1
b = 2

temp = a
a = b
b = temp

puts "a=#{a}, b=#{b}"

# You can do this much more cleanly in Ruby:
a, b = 1, 2 # a=1, b=2

a, b = b, a # b=2, a=1

puts "a=#{a}, b=#{b}"
