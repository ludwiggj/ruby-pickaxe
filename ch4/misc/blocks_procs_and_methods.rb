# http://eli.thegreenplace.net/2006/04/18/understanding-ruby-blocks-procs-and-methods/

# Ruby provides the programmer with a set of very powerful features borrowed from the domain
# of functional programming, namely closures, high-order functions and first-class functions
# These features are implemented in Ruby by means of code blocks, Proc objects and methods
# (that are also objects) - concepts that are closely related and yet differ in subtle ways.

# Procs

# Shamelessly ripping from the Ruby documentation, Procs are defined as follows:

# Proc objects are blocks of code that have been bound to a set of local variables. Once bound,
# the code may be called in different contexts and still access those variables.

# A useful example is also provided:

def gen_times(factor)
  return Proc.new {|n| n*factor }
end

times3 = gen_times(3)
times5 = gen_times(5)

p times3.call(12)               #=> 36
p times5.call(5)                #=> 25
p times3.call(times5.call(4))   #=> 60

# Procs play the role of functions in Ruby. It is more accurate to call them function objects,
# since like everything in Ruby they are objects. Such objects have a name in the folklore -
# functors. A functor is defined as an object to be invoked or called as if it were an ordinary
# function, usually with the same syntax, which is exactly what a Proc is.

# From the example and the definition above, it is obvious that Ruby Procs can also act as
# closures. On Wikipedia, a closure is defined as a function that refers to free variables in
# its lexical context. Note how closely it maps to the Ruby definition blocks of code that have
# been bound to a set of local variables.

# More on Procs

# Procs in Ruby are first-class objects, since they can be:

# (1) created during runtime
# (2) stored in data structures
# (3) passed as arguments to other functions
# (4) returned as the value of other functions

# Actually, the gen_times example demonstrates all of these criteria, except for (3).
# This one can be presented as follows:

def foo (a, b)
  a.call(b)
end

putser = Proc.new {|x| puts x}

p putser.class

foo(putser, 34)

# There is also a shorthand notation for creating Procs - the Kernel method lambda. We'll come
# to methods shortly, but for now assume that a Kernel method is something akin to a global
# function, which can be called from anywhere in the code. Using lambda the Proc object creation
# from the previous example can be rewritten as:

putser = lambda {|x| puts x}

foo(putser, 42)

# Actually, there are two slight differences between lambda and Proc.new:

# (1) Argument checking. The Ruby documentation for lambda states: Equivalent to Proc.new,
#     except the resulting Proc objects check the number of parameters passed when called.
#     Here is an example to demonstrate this:

pnew = Proc.new {|x, y| puts x + y}
pnew.call(2, 4, 11) # works fine, printing 6

lamb = lambda {|x, y| puts x + y}
# The following throws an ArgumentError: wrong number of arguments (3 for 2)
# lamb.call(2, 4, 11)

# (2) There is a difference in the way returns are handled from the Proc. A return from Proc.new
#     returns from the enclosing method, acting just like a return from a block. More on this
#     later:

def try_ret_procnew
    ret = Proc.new { return "Baaam" }
    ret.call
    "This is not reached"
end

# prints "Baaam"
puts try_ret_procnew

#     While return from lambda acts more conventionally, returning to its caller:

def try_ret_lambda
    ret = lambda { return "Baaam" }
    ret.call
    "This is printed"
end

# prints "This is printed"
puts try_ret_lambda

# With this in light, I would recommend using lambda instead of Proc.new, unless the behavior of the
# latter is strictly required. lamdba's behavior is less surprising.

# Methods

# A method is also a block of code. However, unlike Procs, methods are not bound to the local
# variables around them. Rather, they are bound to some object and have access to its instance
# variables:

class Boogy
    def initialize
        @dix = 15
    end

    def arbo
        puts "#{@dix} ha\n"
    end
end

# initializes an instance of Boogy
b = Boogy.new

# prints "15 ha"
b.arbo

# A useful idiom when thinking about methods is sending messages. Given a receiver - an object that
# has some method defined, we can send it a message - by calling the method, optionally providing
# some arguments.

# In the example above, calling arbo is akin to sending a message "arbo", without arguments. Ruby
# supports the message sending idiom more directly, by including the send method in class Object
# (which is the parent of all objects in Ruby). So the following two lines are equivalent to the arbo
# method call:

# method/message name is given as a string
b.send("arbo")

# method/message name is given as a symbol
b.send(:arbo)

# Methods can also be defined in the "top-level" scope, not inside any class. For example:

def say (something)
    puts something
end

say "Hello"

# While it seems that say is "free-standing", it is not. When methods such as this are defined, Ruby
# silently tucks them into the Object class. But this doesn't really matter, and for all practical
# purposes it can be seen as an independent method.

# The following Proc is, in many ways similar:

say = lambda {|something| puts something}

say.call("Hello again")

# same effect
say["Hello, is it me you're looking for?"]

# The [] construct is a synonym to call in the context of Proc.

# Blocks

# Blocks are so powerfully related to Procs that it gives many newbies a headache trying to decipher how
# they actually differ. I will try to ease on comprehension with a (hopefully not too corny) metaphor.
# Blocks, as I see them, are unborn Procs. Blocks are the larvae, Procs are the insects. A block does not
# live on its own - it prepares the code for when it will actually become alive, and only when it is bound
# and converted to a Proc, it starts living:

# a naked block can't live in Ruby. The following code resuts in is a compilation error, and is thus
# commented out... 

# {puts "hello"}

# now it's alive, having been converted to a Proc !
pr = lambda {puts "Hello, I'm a Proc"}
pr.call

# Is that what all the fuss is about, then ? No, not at all. The designer of Ruby, Matz saw that while
# passing Procs to methods (and other Procs) is nice and allows high-level functions and all kinds of fancy
# functional stuff, there is one common case that stands high above all other cases - passing a single block
# of code to a method that makes something useful out of it, for example iteration. And as a very talented
# designer, Matz decided that it is worthwhile to emphasize this special case, and make it both simpler and
# more efficient.

# Passing a block to a method

# No doubt that any programmer who has spent at least a couple of hours with Ruby has been shown the following
# examples of Ruby glory (or something very similar):

10.times do |i|
    print "#{i} "
end

puts

numbers = [1, 2, 5, 6, 9, 21]

numbers.each do |x|
    puts "#{x} is " + (x >= 3 ? "many" : "few")
end

squares = numbers.map {|x| x * x}

puts "#{numbers} squared is #{squares}"

# Note that do |x| ... end is equivalent to { |x| ... }

# Such code is IMHO part of what makes Ruby the clean, readable and wonderful language it is. What happens
# here behind the scenes can be depicted in a very simple way. Perhaps Ruby doesn't implement it exactly this
# way, but it is close enough to the truth to serve as a metaphor for understanding.

# Whenever a block is appended to a method call, Ruby automatically converts it to a Proc object, but one
# without an explicit name. The method, however, has a way to access this Proc, by means of the yield
# statement.

# The method do_twice is defined and called with an attached block. Although the method didn't explicitly ask
# for the block in its arguments list, the yield can call the block.
def do_twice
    yield 
    yield
end

do_twice { puts "Hola" }

# This can be implemented in a more explicit way, using a Proc argument:

def do_twice(what)
    what.call
    what.call
end

do_twice lambda {puts "Hola"}

# This is equivalent to the previous example, but using blocks with yield is cleaner, and better optimized
# since only one block is passed to the method, for sure. Using the Proc approach, any amount of code blocks
# can be passed:

def do_twice(what1, what2, what3)
    2.times do
        what1.call
        what2.call
        what3.call
    end
end

do_twice(
  lambda {print "Hola, "},
  lambda {print "querido "},
  lambda {print "amigo\n"}
)

# It is important to note that many people frown at passing blocks, and prefer explicit Procs instead. Their
# rationale is that a block argument is implicit, and one has to look through the whole code of the method to
# see if there are any calls to yield there, while a Proc is explicit and can be immediately spotted in the
# argument list. While it's simply a matter of taste, understanding both approaches is vital.

# The ampersand (&)

# The ampersand operator can be used to explicitly convert between blocks and Procs in a couple of esoteric
# cases. It is worthy to understand how these work.

# Remember that although an attached (implicit) block is converted to a Proc under the hood, it is not
# acessible as a Proc from inside the method. If an ampersand is prepended to the last argument in the
# argument list of a method, the block attached to this method is converted to a Proc object and gets
# assigned to that last argument:

def contrived(a, &f)
    # the block can be accessed through f
    f.call(a)

    # but yield also works 
    yield(a)
end

# this works
contrived(25) { |x| puts x }

# this doesn't (ArgumentError, wrong number of arguments (2 for 1)), because &f isn't really an argument.
# It's only there to convert a block

# contrived(25, lambda {|x| puts x})

# Another (IMHO far more efficacious) use of the ampersand is the other-way conversion - converting a
# Proc into a block. This is very useful because many of Ruby's great built-ins, and especially the
# iterators, expect to receive a block as an argument, and sometimes it's much more convenient to pass
# them a Proc. The following example is taken right from the excellent "Programming Ruby" book by the
# pragmatic programmers:

print "(t)imes or (p)lus: "

times = gets

print "number: "

number = Integer(gets)

if times =~ /^t/
    calc = lambda {|n| n*number }
else
    calc = lambda {|n| n+number }
end

puts((1..10).collect(&calc).join(", "))

# The collect method expects a block, but in this case it is convenient to provide it with a Proc,
# since the Proc is constructed using knowledge gained from the user. The ampersand preceding calc makes
# sure that the Proc object calc is turned into a code block and is passed to collect as an attached block.

# The ampersand also allows the implementation of a very common idiom among Ruby programmers: passing method
# names into iterators. Assume that I want to convert all words in an Array to upper case. I could do it
# like this:

words = %w(Jane, aara, multiko)

upcase_words = words.map {|x| x.upcase}

p upcase_words

# This is nice, and it works, but I feel it's a little bit too verbose. The upcase method itself should be
# given to map, without the need for a separate block and the apparently superfluous x argument. Fortunately,
# as we saw before, Ruby supports the idiom of sending messages to objects, and methods can be referred to by
# their names, which are implemented as Ruby Symbols.

# For example, the following says send the message/method upcase to the object "Erik".

p "Erik".send(:upcase)

=begin

# Ignore this example for the moment as it is quite advanced...

# This feature can be utilized to implement the map {|x| x.upcase} in an elegant manner. When the ampersand is
# prepended to some Proc in a method call, it converts the Proc to a block. But if it's prepended to another
# object then Ruby calls the to_proc method on the object to try and make a Proc out of it. We can use this to
# implement to_proc for Symbol and achieve what we want:

# This is monkey patching!
class Symbol

    # A generalized conversion of a method name
    # to a proc that runs this method.
    #
    def to_proc
        lambda {|x, *args| x.send(self, *args)}
    end

end

# Viola !
words = %w(Jane, aara, multiko)
p words.map(&:upcase)

=end

# Conclusion

# Ruby doesn't really have functions. Rather, it has two slightly different concepts - methods and Procs (which
# are, as we have seen, simply what other languages call function objects, or functors). Both are blocks of
# code - methods are bound to Objects, and Procs are bound to the local variables in scope. Their uses are quite
# different.

# Methods are the cornerstone of object-oriented programming, and since Ruby is a pure-OO language (everything
# is an object), methods are inherent to the nature of Ruby. Methods are the actions Ruby objects do - the
# messages they receive, if you prefer the message sending idiom.

# Procs make powerful functional programming paradigms possible, turning code into a first-class object of Ruby
# allowing to implement high-order functions. They are very close kin to Lisp's lambda forms (there's little
# doubt about the origin of Ruby's Proc constructor lambda)

# The construct of a block may at first be confusing, but it turns out to be quite simple. A block is, as my
# metaphor goes, an unborn Proc - it is a Proc in an intermediate state, not bound to anything yet. I think that
# the simplest way to think about blocks in Ruby, without losing any comprehension, would be to think that blocks
# are really a form of Procs, and not a separate concept. The only time when we have to think of blocks as
# slighly different from Procs is the special case when they are passed as the last argument to a method which
# may then access them using yield.
