# Convention for parameters

# Use brackets with parameters

def my_new_method(arg1, arg2, arg3) # 3 arguments
  # Code for the method would go here
end

# Omit brackets when no parameters

def my_other_new_method # No arguments
  # Code for the method would go here
end

# Method with default parameter values
def cool_dude(arg1="Miles", arg2="Coltrane", arg3="Roach")
  puts "#{arg1}, #{arg2}, #{arg3}."
end

cool_dude                            # => "Miles, Coltrane, Roach."
cool_dude("Bart")                    # => "Bart, Coltrane, Roach."
cool_dude("Bart", "Elwood")          # => "Bart, Elwood, Roach."
cool_dude("Bart", "Elwood", "Linus") # => "Bart, Elwood, Linus."

# Example where the default argument references a previous argument:

def surround(word, pad_width=word.length/2)
  puts "[" * pad_width + word + "]" * pad_width
end

surround("elephant") # => "[[[[elephant]]]]"
surround("fox")      # => "[fox]"
surround("fox", 10)  # => "[[[[[[[[[[fox]]]]]]]]]]"

# Passing parameters:

# Any parameters follow the method name. If no ambiguity exists, you can omit the parentheses
# around the argument list when calling a method. Other Ruby documentation sometimes calls
# method calls without parentheses commands.

# However, except in the simplest cases we don’t recommend this—some subtle problems can trip
# you up. In particular, you must use parentheses on a method call that is itself a parameter
# to another method call, unless it is the last parameter.

# A simple rule: if you have any doubt, use parentheses.

puts "Bob".hash
puts "Bob".hash() # Equivalent

cool_dude "A", "B", "C"
cool_dude("A", "B", "C") # Equivalent with parentheses.
