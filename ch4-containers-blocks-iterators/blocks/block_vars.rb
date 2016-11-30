# Block local variable is the same as the global one
square = "Square"
puts square # => Square

sum = 0
[1, 2, 3, 4].each do |value|
  square = value * value # altering local value also alters global one
  sum += square
end

puts sum    # => 30
puts square # => 16

# Block parameters are distinct
value = "some shape"

[ 1, 2 ].each {|value| puts value } # => 1 2

puts value # => some shape

# This is the way to declare a block local variable

square = "Square"
puts square  # => Square

sum = 0
[1, 2, 3, 4].each do |value; square|
  square = value * value
  sum += square
end

puts sum     # => 30
puts square  # => Square
