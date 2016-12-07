puts 1 + 2               # => 3
puts 1 + 2.0             # => 3.0
puts 1.0 + 2             # => 3.0
puts 1.0 + Complex(1,2)  # => 2.0 + 2i
puts 1 + Rational(2,3)   # => 5/3
puts 1.0 + Rational(2,3) # => 1.66666666665

puts 1.0 / 2             # => 0.5
puts 1 / 2.0             # => 0.5

puts 1 / 2                   # => 0 gotcha!
puts 22 / 7                  # => 3
puts Complex::I * Complex::I # => -1 + 0i

require 'mathn'

# results are now the most natural, mathematically speaking

puts 1 / 2                   # => 1/2, rational literal
puts 22 / 7                  # => 22/7
puts Complex::I * Complex::I # => -1
