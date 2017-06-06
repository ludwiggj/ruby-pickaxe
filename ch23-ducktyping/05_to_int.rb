# to_int → Integer
# This is used when the interpreter expects to see an integer value (such as a file descriptor
# or as a parameter to Object#Integer).

class OneTwo
  def to_int
    12
  end
end

class ThreeFour
  def to_i
    34
  end
end

class FiveSix
end

# puts 1 + OneTwo.new           # => OneTwo can't be coerced into Fixnum
puts 1 + Integer(OneTwo.new)    # => 13 (works with to_int)
puts 1 + Integer(ThreeFour.new) # => 35 (works with to_i)
puts 1 + Integer(FiveSix.new)   # => can't convert FiveSix into Integer
