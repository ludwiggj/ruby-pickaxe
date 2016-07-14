# Named parameters aka keyword arguments refer to a language's support
# for function calls that cleary state the name of each parameter
# at the site of the function call itself

# Before Ruby 2.0, this can be emulated by passing a hash as an argument\
# to a method

def foo(options = {})
  puts "Args #{options[:bar]} #{options[:buz]}" 
end

foo
foo(bar: "bar")
foo(buz: "buz")
foo(bar: "bar", buz: "buz")

# But it's not easy to set default values for the arguments.
# Following works, but looks a bit hacky...

def foo(options = {})
  options = {bar: "bar"}.merge(options)
  puts "Args #{options[:bar]} #{options[:buz]}" 
end

foo
foo(bar: "bar")
foo(buz: "buz")
foo(bar: "bear", buz: "buz")

# With Ruby 2.0, keyword arguments are properly supported

def fooey(str: "foo", num: 424242)
  [str, num]
end

p fooey(str: 'buz', num: 9)
p fooey(str: 'bar')
p fooey
# p fooey(bar: 'buz') # This resukts in an ArgumentError exception

# Can also include ordinary arguments

def foox(x, str: "foo", num: 424242)
  [x, str, num]
end

p foox(13)
p foox(15, num: 24)

# And hashes, which requires **

def fooh(str: "foo", num: 424242, **options)
  [str, num, options]
end

p fooh
p fooh(check: true, chick: false)

# ** is required because you can't write foobar as below, as it results in
# syntax error, unexpected ')', expecting end-of-input

# def foobar(str: "foo", num: 424242, options={})
#  [str, num, options]
# end

# It works with blocks too

define_method(:foo) { |str: "foo", num: 424242| [str, num] }
