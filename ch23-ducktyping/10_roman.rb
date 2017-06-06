class Roman
  
  MAX_ROMAN = 4999
  attr_reader :value
  protected :value

  def initialize(value)
    if value <= 0 || value > MAX_ROMAN
      fail "Roman values must be > 0 and <= #{MAX_ROMAN}"
    end
    @value = value
  end
  
  def coerce(other)
    if Integer === other
      [ other, @value ]
    else
      [ Float(other), Float(@value) ]
    end
  end

  def +(other)
    if Roman === other
      other = other.value
    end
    
    if Fixnum === other && (other + @value) < MAX_ROMAN
      Roman.new(@value + other)
    else
      x, y = other.coerce(@value)
      x + y
    end
  end

  FACTORS = [["m", 1000], ["cm", 900], ["d", 500], ["cd", 400],
             ["c", 100], ["xc", 90], ["l", 50], ["xl", 40],
             ["x", 10], ["ix", 9], ["v", 5], ["iv", 4],
             ["i", 1]]

  def to_s
    value = @value
    roman = ""
    for code, factor in FACTORS
      count, value = value.divmod(factor)
      roman << (code * count)
    end
    roman
  end

  def to_str
    to_s
  end
end

iv = Roman.new(4)
xi = Roman.new(11)

# coerce method allows Roman to be argument to basic maths operators
p 3 * iv    # => 12
p 1.5 * xi  # => 16.5 
p 2.6 + iv  # => 6.6
p 7 + 11    # => 18

# Now try out the new plus method
vii = iv + 3

p vii          # => #<Roman:0x007fd37d1611f8 @value=7>
p "" + vii     # => vii (this depends on to_str being implemented)
p vii.to_s     # => vii

puts vii
puts "" + vii  # => vii (this depends on to_str being implemented)
puts vii.to_s

puts iv + 3 + 4   # => xi
puts iv + 3.14159 # => 7.14159
puts xi + 4900    # => mmmmcmxi
puts xi + 4990    # => 5001

puts xi + 'This will break' # => `+': undefined method `coerce' for "This will break":String (NoMethodError)
