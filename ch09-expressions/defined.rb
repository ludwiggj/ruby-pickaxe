# The defined? operator returns nil if its argument (which can be an arbitrary expression) is not
# defined; otherwise, it returns a description of that argument. If the argument is yield,
# defined? returns the string "yield" if a code block is associated with the current context.

puts defined? 1        # => "expression"
puts defined? dummy    # => nil
puts defined? printf   # => "method"
puts defined? String   # => "constant"
puts defined? $_       # => "global-variable"
puts defined? Math::PI # => "constant"
puts defined? a = 1    # => "assignment"
puts defined? 42.abs   # => "method"
puts defined? nil      # => "nil"
puts defined? yield    # => nil

def do_it
  puts defined? yield  # => yield
  yield 1
  puts defined? yield  # => yield
end

do_it { |x| puts x }
