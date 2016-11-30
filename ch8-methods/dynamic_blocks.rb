# We’re teaching math skills. A student asks for an n-plus table or an n-times table

print "(t)imes or (p)lus: "
operator = gets
print "number: "
number = Integer(gets)

# Collect expects a block (important for later...)
if operator =~ /^t/
  puts((1..10).collect {|n| n*number }.join(", "))
else
  puts((1..10).collect {|n| n+number }.join(", "))
end

# Factor out the block that does the calculation:

print "(t)imes or (p)lus take 2!: "
operator = gets
print "number: "
number = Integer(gets)

if operator =~ /^t/
  calc = lambda {|n| n*number }
else
  calc = lambda {|n| n+number }
end

puts calc.class # lambda returns a Proc

# Note that & has a special meaning in argument list - when used as prefix for Proc object it passes
# it as block to method being called. Within method body it's just a binary operator.
puts((1..10).collect(&calc).join(", "))

# Or as the book puts it:

# If the last argument to a method is preceded by an ampersand, Ruby assumes that it is a Proc
# object. It removes it from the parameter list, converts the Proc object into a block, and
# associates it with the method.
