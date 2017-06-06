# to_a → Array

# This is used when interpreter needs to convert an object into an array for parameter
# passing or multiple assignment.

class OneTwo
  def to_a
    [ 1, 2 ]
  end

  def to_s
    "One Two"
  end
end

ot = OneTwo.new
puts OneTwo.new     # => One Two (to_a is NOT the same as to_ary, so to_s called here)

a, b = *ot
puts "a = #{a}, b = #{b}"
printf("%d -- %d\n", *ot)
