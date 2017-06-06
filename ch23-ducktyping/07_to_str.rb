class OneTwo
  def to_str
    "one-two"
  end
end

class ThreeFour
  def to_s
    "three-four"
  end
end

ot = OneTwo.new

puts("count: " + ot)                    # Coerced automatically, unlike integers
File.open(ot) rescue puts $!.message

puts("count: " + String.new(ot))        # to_str supported 

tf = ThreeFour.new

# puts("count: " + tf)                  # to_s not supported (no implicit conversion of ThreeFour into String (TypeError))

# puts("count: " + String.new(tf))      # Ditto
