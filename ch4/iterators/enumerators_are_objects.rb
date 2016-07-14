# Enumerable module defines each_with_index. This invokes its host class’s each
# method, returning successive values along with an index:
result = []
[ 'a', 'b', 'c' ].each_with_index { |item, index| result << [item, index] }
p result

# But some classes don't have an each method, like String
# Following results in:
#   undefined method `each' for "cat":String (NoMethodError)
#
# p "cat".each.class

# We solve this via the String's each_char method, which returns an enumerator if you
# don’t give it a block
p "cat".each_char.class

# You can then call each_with_index on that enumerator
result = []
"cat".each_char.each_with_index { |item, index| result << [item, index] }
p result

# with_index method is the same as each_with_index, but reads better in code
result = []
enum = "cat".each_char.with_index
p enum.to_a

# enumerator's to_a method enumerates all values and places them in an array
enum = "cat".each_char
p enum.to_a

# alternative way of achieving the same result,
# enum_for is syntactic sugar that makes the intent clearer
enum = "cat".enum_for(:each_char)
p enum.to_a

# iterate in groups of 3
enum_in_threes = (1..10).each_slice(3)
p enum_in_threes.to_a

enum_in_threes = (1..10).enum_for(:each_slice, 3)
p enum_in_threes.to_a
