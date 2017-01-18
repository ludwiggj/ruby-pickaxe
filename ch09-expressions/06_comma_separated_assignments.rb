# Ruby lets you have a comma-separated list of rvalues (the things on the right of the assignment).
# Once Ruby sees more than one rvalue in an assignment, the rules of parallel assignment come into
# play.
#
# First, all the rvalues are evaluated, left to right, and collected into an array (unless they are
# already an array). This array will be the eventual value returned by the overall assignment.
#
# Next, the left side (lhs) is inspected. If it contains a single element, the array is assigned to
# that element.

a = 1, 2, 3, 4
p a                # => [1, 2, 3, 4]
b = [1, 2, 3, 4]
p b                # => [1, 2, 3, 4]

# If the lhs contains a comma, Ruby matches values on the rhs against successive elements on
# the lhs. Excess elements are discarded.
a, b = 1, 2, 3, 4
puts "#{a} #{b}"   # => a=1, b=2 (c and d are lost)

c, = 1, 2, 3, 4
p c                # => c=1
