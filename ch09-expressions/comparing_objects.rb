# Object comparison methods:
#
# ==, ===, <=>, =~, eql?, and equal?
#
# All but <=> are defined in class Object but are often overridden by descendants to provide
# appropriate semantics.
#
# For example, class Array redefines == so that two array objects are equal if they have the
# same number of elements and the corresponding elements are equal.

puts [1, 2, 3] == [1, 2, 3]    # => true
puts [1, 2, 3] == [1, 2, 3, 4] # => false

#
# Both == and =~ have negated forms, != and !~. Ruby first looks for methods called != or !~,
# calling them if found. If not, it will then invoke either == or =~, negating the result.
#
# In the following example, Ruby calls the == method to perform both comparisons:

class T
  def ==(other)
    puts "Comparing self == #{other}"
    other == "value"
  end
end

t = T.new
p(t == "value") # => Comparing self == value, true
p(t != "value") # => Comparing self == value, false

# If instead we explicitly define !=, Ruby calls it:

class U
  def ==(other)
    puts "Comparing self == #{other}"
    other == "value"
  end
  
  def !=(other)
    puts "Comparing self != #{other}"
    other != "value"
  end
end

u = U.new
p(u == "value") # => Comparing self == value, true 
p(u != "value") # => Comparing self != value, false

# <=> is general comparison operator. Returns -1, 0, or +1, depending on whether its
# receiver is less than, equal to, or greater than its argument.

puts 1 <=> 1 # => 0
puts 1 <=> 0 # => 1
puts 1 <=> 2 # => -1

# eql?
#
# True if the receiver and argument have both the same type and equal values.

puts 1 == 1.0    # => true
puts 1.eql?(1.0) # => false

# equal?
#
# True if the receiver and argument have the same object ID

puts 1.equal?(1)     # => true
puts "a".equal?("a") # => false
puts t.equal?(t)     # => true
puts t.equal?(T.new) # => false
