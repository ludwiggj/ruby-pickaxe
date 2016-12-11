# Nested Assignments

# The left side of an assignment may contain a parenthesized list of terms. Ruby treats these
# terms as if they were a nested assignment statement. It extracts the corresponding rvalue,
# assigning it to the parenthesized terms, before continuing with the higher-level assignment.

a, (b, c), d = 1,2,3,4           # => a=1, b=2, c=nil, d=3
puts "a=#{a} b=#{b} c=#{c} d=#{d}"

a, (b, c), d = [1,2,3,4]         # => a=1, b=2, c=nil, d=3
puts "a=#{a} b=#{b} c=#{c} d=#{d}"

a, (b, c), d = 1,[2,3],4         # => a=1, b=2, c=3, d=4
puts "a=#{a} b=#{b} c=#{c} d=#{d}"

a, (b, c), d = 1,[2,3,4],5       # => a=1, b=2, c=3, d=5
puts "a=#{a} b=#{b} c=#{c} d=#{d}"

a, (b, *c), d = 1,[2,3,4],5      # => a=1, b=2, c=[3, 4], d=5
puts "a=#{a} b=#{b} c=#{c} d=#{d}"
