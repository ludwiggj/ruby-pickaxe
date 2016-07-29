puts 123456      # Fixnum => 123456
puts 0d123456    # Fixnum => 123456
puts 123_456     # Fixnum => 123456 -underscore ignored
puts -543        # Fixnum => -543 -negative number
puts 0xaabb      # Fixnum => 43707 -hexadecimal
puts 0377        # Fixnum => 255 -octal
puts -0b10_1010  # Fixnum => -42 -binary (negated)
puts 123_456_789_123_456_789 => 123456789123456789 # Bignum

# A numeric literal with a decimal point and/or an exponent is turned into a Float object,
# corresponding to the native architecture's double data type. You must both precede and
# follow the decimalbpoint with a digit (if you write 1.0e3 as 1.e3, Ruby will try to
# invoke the method e3 on the object 1).
puts 1.0e3

puts Rational(3,4) * Rational(2,3) #=> (1/2) 
puts Rational("3/4") * Rational("2/3") #=> \(1/2)
puts Complex(1,2) * Complex(3,4) #=> (-5+10i)
puts Complex("1+2i") * Complex("3+4i") #=> (-5+10i)

puts -5.abs
puts 9.abs
