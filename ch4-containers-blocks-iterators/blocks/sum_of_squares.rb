sum = 0
[1, 2, 3, 4].each do |value|
  square = value * value
  # The sum variable here is the same one as declared outside of the each loop
  sum += square
end
puts sum # => 30
# square is not defined here, only within the scope of the each block
