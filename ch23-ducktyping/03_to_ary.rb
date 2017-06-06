# to_ary → Array

# This is used when interpreter needs a parameter to a method to be an array and when
# expanding parameters and assignments containing the *xyz syntax.

# puts method:
# If called with an array argument, writes each element on a new line
# Each given object that isn’t a string or array will be converted by calling its to_s method.
# If called without arguments, outputs a single newline.
class OneTwo
  def to_ary
    [ 1, 2 ]
  end

  def to_s
    "One Two"
  end
end

class ThreeFour
  def to_s
    "Three Four"
  end
end

ot = OneTwo.new
puts ot            # => 1 2 (converted to array as class implements to_ary)
puts ThreeFour.new # => Three Four (to_s method called as class does not implement to_ary) 

# Following fails as OneTwo does not implement to_a
# a, b = *ot
# puts "a = #{a}, b = #{b}"
# printf("%d -- %d\n", *ot)

# Error:
#
# a = One Two, b =
# 03_to_ary.rb:32:in `printf': can't convert OneTwo into Integer (TypeError)
# from 03_to_ary.rb:32:in `<main>'
