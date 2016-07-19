# Following taken from
#
# http://www.skorks.com/2013/04/ruby-ampersand-parameter-demystified/

# (1) The implicit block

def hello
end

# This generates no output
hello do
  puts "hello"
end

# This calls the implicit block
def hello_again
  yield if block_given?
end

hello_again do
  puts "hello via implicit block"
end

# Let's define a lambda
#
# -> == Dash Rocket
#
# Used to define a lambda literal in Ruby 1.9.X (without args) and Ruby 2.X (with args) e.g.
#
# -> (x) { x * 2 }
# 
# which is equivalent to
#
# lambda { |x| x * 2 } are in fact equivalent

blah = -> { puts "lambda" }

puts "blah.call START >>"
blah.call
puts "<< END blah.call"

# Following use of blah doesn't do anything
puts "blah START >>"
blah
puts "<< END blah"

p blah.class # lamba is a Proc

# Ruby allows to us pass any object to a method and have the method attempt to use this object as its block

# If we put an ampersand in front of the last parameter to a method, Ruby will try to treat this parameter
# as the method’s block.

# treat blah lambda (proc) as the method's block
# In this case, the argument is already a Proc object.
# Ruby will simply associate it with the method as its block.
hello_again(&blah)

# If the parameter is not a Proc, Ruby will try to convert it into one (by calling to_proc on it)
# before associating it with the method as its block.

class FooBar
  def to_proc
    -> { puts 'converted lambda' }
  end
end

hello_again(&FooBar.new)

# If I want to take the block that was associated with hello_again pass it to another method, I
# need a way to refer to the block. Therefore we need...
#
# (2) The explicit block
#
# When we write our method definition, we can explicitly state that we expect this method to possibly
# take a block. Confusingly, Ruby uses the ampersand for this as well:

def hello_yet_again(&block)
  yield if block_given?
end

hello_yet_again do
  puts "hello via explicit block"
end

# This gives us a name by which we can refer to our block within the method body. And since our block
# is a Proc object, instead of yielding to it, we can call it:

def hello_the_fourth(&block)
  block.call if block_given? # The block.call syntax makes things clearer.
end

hello_the_fourth do
  puts "hello via explicit block call"
end

# Of course, when we define our method we don’t have to use the name ‘block’, we can do:
def hello_foo(&foo)
  foo.call if block_given?
end

hello_foo do
  puts "hello foo"
end

hello_foo(&blah)

# Having said that, ‘block’ is a good convention.

# Following call results in wrong number of arguments error (1 for 0)
# This is because a block parameter (i.e. prepended with &)  is not really regarded as a parameter

# hello_foo(blah)

# So, in the context of methods and blocks, there are two ways we use the ampersand:

#   (1) in the context of a method definition, putting an ampersand in front of the last parameter
#       indicates that a method may take a block and gives us a name to refer to this block within
#       the method body

#   (2) in the context of a method call, putting an ampersand in front of the last argument tells
#       Ruby to convert this argument to a Proc if necessary and then use the object as the
#       method’s block

# Passing A Regular Block and A Block Argument To A Method

# It is instructive to see what happens when you try to pass a both a regular block and a block
# argument to a method:

# You get the following error message:
# both block arg and actual block given, It is not even an exception – it’s a syntax error!

# hello_yet_again(&blah) do
#   puts "hello"
# end

# Using Another Method As A Block

# It’s also interesting to note that since you can easily get a reference to a method in ruby and
# the Method object implements to_proc, you can easily give one method as a block to another e.g.:

def world
  puts "world"
end

method_reference = method(:world)

p method_reference.class # Method

hello_yet_again(&method_reference)

# Passing The Block Around

# We now know enough to easily understand our the following example:

# We define blah to expect a block, inside blah we can refer to this block as block
def blah(&block)
  # when we call yadda from within blah we pass it our block variable without the ampersand,
  # since yadda does not a expect a block parameter, but simply a regular method argument,
  # in our case this regular method argument will just happen to be a Proc object
  yadda(block)
end

# We define yadda to expect one parameter, this parameter would be referred to as block
# inside yadda, but it is not actually defined as a block (i.e. it's not preceded by
# the & operator)
def yadda(block)
  # can't call yield, results in error: no block given (yield) (LocalJumpError)
  # yield block
  
  puts "Block passed to yadda is #{block.class}"
  block.call    # can use block.call, but this will only work if a block is actually passed
  
  # when we call foo from inside yadda we pass it our block variable, but this time with an
  # ampersand since foo actually expects a block and we want to give it a block rather than
  # just a regular variable
  foo(&block)
end

# Following call to yadda results in undefined method `call' for String (NoMethodError)

# yadda("This will cause an error as it's not a block")

# foo also expects a block and we can refer to this block as block inside foo
def foo(&block)
  block.call
end

blah do
  puts "hello, via yadda"
end

# It should now be much more obvious why the ampersand is used in some cases, but not in others.

# Can call yadda and pass it a Method, this works fine
yadda(method_reference)

# But the following results in error: wrong number of arguments (0 for 1) (ArgumentError)

# yadda(&method_reference)

# The following gives error: syntax error, unexpected &

# a_proc = & method_reference

# But the following is ok
a_proc = method_reference.to_proc
p a_proc.class # Proc

yadda(a_proc)

# So it looks like the yadda(&method_reference) call would only be valid if yadda's parameter
# was declared as a block parameter

# Let's confirm this by redefining yadda to use a block parameter
def yadda(&block)
  puts "Block passed to yadda is #{block.class}"
  block.call 
  foo(&block)
end

# Following is invalid, wrong number of arguments (1 for 0) (ArgumentError)
# yadda(method_reference)

# But this now works, Method is converted to Proc 
yadda(&method_reference)

# Same deal for a_proc
yadda(&a_proc)

=begin

The Symbol To Proc Trick

We should now also have a lot less trouble understanding the ‘symbol to proc’ trick. You’ve no doubt seen code like this:

p ["a", "b"].map(&:upcase)

We know that this is equivalent to:

p ["a", "b"].map{|string| string.upcase}

But now we also make an educated guess as to why they are equivalent. We have a Symbol object (‘:upcase’), we put an ampersand in front of it and pass it to the map method. The map method takes a block, and by using the ampersand we’ve told Ruby that we want to convert our Symbol object to a Proc and associate it with the map method as its block. It turns out that Symbol implements to_proc in a special way, so that the resulting block becomes functionally equivalent to our second example above. Of course these days Ruby implements Symbol#to_proc using C, so it’s not quite as nice looking as the examples you’ll find around the web, but you get general idea.

Anyway, hopefully this makes blocks and ampersands a bit more friendly. 
=end
