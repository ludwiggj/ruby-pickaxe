def varargs(arg1, *rest)
  puts "arg1=#{arg1}. rest=#{rest.inspect}"
end

varargs("one")                # => arg1=one. rest=[]
varargs("one", "two")         # => arg1=one. rest=["two"]
varargs "one", "two", "three" # => arg1=one. rest=["two", "three"]

# You can put the splat argument anywhere in a method’s parameter list, allowing you to write this:
def split_apart(first, *splat, last)
  puts "First: #{first.inspect}, splat: #{splat.inspect}, last: #{last.inspect}"
end

split_apart(1, 2)       # => First: 1, splat: [], last: 2
split_apart(1, 2, 3)    # => First: 1, splat: [2], last: 3
split_apart(1, 2, 3, 4) # => First: 1, splat: [2, 3], last: 4


# If you cared only about the first and last parameters...
def split_apart_again(first, *, last)
  puts "First: #{first.inspect}, last: #{last.inspect}"
end

split_apart_again(1, 2)       # => First: 1, last: 2
split_apart_again(1, 2, 3)    # => First: 1, last: 3
split_apart_again(1, 2, 3, 4) # => First: 1, last: 4

# Splat in reverse

def five(a, b, c, d, e)
  puts "I was passed #{a} #{b} #{c} #{d} #{e}"
end

five(1, 2, 3, 4, 5 )       # => "I was passed 1 2 3 4 5"
five(1, 2, 3, *['a', 'b']) # => "I was passed 1 2 3 a b"
five(*['a', 'b'], 1, 2, 3) # => "I was passed a b 1 2 3"
five(*(10..14))            # => "I was passed 10 11 12 13 14"
five(*[1,2], 3, *(4..5))   # => "I was passed 1 2 3 4 5"
