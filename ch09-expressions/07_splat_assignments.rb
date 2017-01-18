# Splats and Assignment
#
# If Ruby sees any splats on the right side of an assignment (that is, rvalues preceded by an
# asterisk), each will be expanded inline into its constituent values during the evaluation of
# the rvalues and before the assignment to lvalues starts:

a, b, c, d, e = *(1..2), 3, *[4, 5]
puts "#{a} #{b} #{c} #{d} #{e}"     # => a=1, b=2, c=3, d=4, e=5

# Exactly one lvalue may be a splat. This makes it greedy—it will end up being an array, and that
# array will contain as many of the corresponding rvalues as possible. So, if the splat is the
# last lvalue, it will soak up any rvalues that are left after assigning to previous lvalues:

a, *b = 1, 2, 3
puts "#{a} #{b}"   # => a=1, b=[2, 3]

a, *b = 1
puts "#{a} #{b}"   # => a=1, b=[]

# If the splat is not the last lvalue, then Ruby ensures that the lvalues that follow it will all
# receive values from rvalues at the end of the right side of the assignment—the splat lvalue
# will soak up only enough rvalues to leave one for each of the remaining lvalues.
*a, b = 1, 2, 3, 4
puts "#{a} #{b}"                # => a=[1, 2, 3], b=4

c, *d, e = 1, 2, 3, 4
puts "#{c} #{d} #{e}"           # => c=1, d=[2, 3], e=4

f, *g, h, i, j = 1, 2, 3, 4
puts "#{f} #{g} #{h} #{i} #{j}" # => f=1, g=[], h=2, i=3, j=4

# As with method parameters, you can use a raw asterisk to ignore some rvalues:
first, *, last = 1,2,3,4,5,6
puts "#{first} #{last}"         # => first=1, last=6
