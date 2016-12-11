def display_boolean(val)
  if (val)
    puts "[#{val}] is true"
  else
    puts "[#{val}] is false"
  end
end

display_boolean(true)  # => true
display_boolean(0)     # => true
display_boolean("")    # => true
display_boolean('')    # => true
display_boolean("cat") # => true
display_boolean(:dog)  # => true
display_boolean(false) # => false
display_boolean(nil)   # => false

# Shortcircuit and (and, &&). and binds lower than &&.
puts "nil && 99 = [#{nil && 99}]"       # => nil
puts "nil and 99 = [#{nil and 99}]"     # => nil
puts "false && 99 = [#{false && 99}]"   # => false
puts "false and 99 = [#{false and 99}]" # => false
puts "'cat' && 99 = [#{'cat' && 99}]"   # => 99
puts "'cat' and 99 = [#{'cat' and 99}]" # => 99

# Shortcircuit or (or, ||). or binds lower than ||.
puts "nil || 99 = [#{nil || 99}]"       # => 99
puts "nil or 99 = [#{nil or 99}]"       # => 99
puts "false || 99 = [#{false || 99}]"   # => 99
puts "false or 99 = [#{false or 99}]"   # => 99
puts "'cat' || 99 = [#{'cat' || 99}]"   # => cat
puts "'cat' or 99 = [#{'cat' or 99}]"   # => cat

# NOTE: and and or have the same precedence, but && has a higher precedence than ||.
