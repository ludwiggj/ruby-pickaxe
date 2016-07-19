# We can use a module to encapsulate the ability to sum elements of a collection

module Summable
  def sum
    inject(:+)
  end
end

# Range does not have a sum method
# undefined method `sum' for 1..5:Range (NoMethodError)

# p (1..5).sum

# Now it does...

class Range
  include Summable
end

p (1..5).sum

# Same for arrays

# p [1, 2, 3, 4, 5, 6].sum

class Array
 include Summable
end

p [1, 2, 3, 4, 5, 6].sum

require_relative "../mixins/vowel_finder"

vf = VowelFinder.new("the quick brown fox jumped over the arches")

puts vf.inject(:+)

# puts vf.sum

class VowelFinder
  include Summable
end

puts vf.sum
