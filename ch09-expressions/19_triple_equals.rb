# http://stackoverflow.com/questions/4467538/what-does-the-operator-do-in-ruby

# Just like with every other method in Ruby (or actually pretty much any object-oriented language),

# a === b

# means whatever the author of a's class wants it to mean. However, if you don't want to confuse the
# heck out of your colleagues, the convention is that === is the case subsumption operator.
# Basically, it's a boolean operator which asks the question "If I have a drawer labelled a would it
# make sense to put b in that drawer?"

# An alternative formulation is "If a described a set, would b be a member of that set?" For example:

puts (1..5) === 3            # => true
puts (1..5) === 6            # => false

puts Integer === 42          # => true
puts Integer === 'fourtytwo' # => false

puts /ell/ === 'Hello'       # => true
puts /ell/ === 'Foobar'      # => false

# The main usage for the === operator is in case expressions, since

# case foo
#   when bar
#     baz
#   when quux
#     flurb
#   else
#     blarf
# end

# gets translated to something (roughly) like

# _temp = foo

# if bar === _temp
#   baz
# elsif quux === _temp
#   flurb
# else
#   blarf
# end

# This operator has absolutely nothing whatsoever to do with equality.

# Equality is symmetric: if a is equal to b, then b better be also equal to a. Also, one would expect
# equality to be transitive: if a == b and b == c, then a == c. While there is no way to actually
# guarantee that in a single-dispatch language like Ruby, you should at least make an effort to
# preserve this property (for example, by following the coerce protocol).

# However, for === there is no expectation of either symmetry or transitivity. In fact, it is very
# much by design not symmetric. That's why I don't like calling it anything that even remotely
# resembles equality. It's also why I think, it should have been called something else like ~~~
# or whatever.
