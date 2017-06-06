names = %w{ant bee cat}
puts "name=#{names}"

result = names.map {|name| name.upcase}
puts "result=#{result}"

resultWithProc = names.map(&:upcase)
puts "resultWithProc=#{resultWithProc}"

# When you say names.map(&xxx), you’re telling Ruby to pass the Proc object in xxx to the map
# method as a block. If xxx isn’t already a Proc object, Ruby tries to coerce it into one by sending
# it a to_proc message.

# :upcase isn’t a Proc object; it’s a symbol. So when Ruby sees names.map(&:upcase), the
# first thing it does is try to convert the symbol :upcase into a Proc by calling to_proc. And, by
# an incredible coincidence, Ruby implements just such a method. If it was written in Ruby,
# it would look something like this:
#
# def to_proc
#   proc { |obj, *args| obj.send(self, *args) }
# end
#
# This method creates a Proc, which, when called on an object, sends that object the symbol
# itself. So, when names.map(&:upcase) starts to iterate over the strings in names, it’ll call the
# block, passing in the first name and invoking its upcase method.
#
# It’s an incredibly elegant use of coercion and of closures. However, it comes at a price. The
# use of dynamic method invocations mean that the version of our code that uses &:upcase is
# about half as fast as the more explicitly coded block.

class Greeter
  def hello
    puts "Hello!"
  end
end

g = Greeter.new

g.hello

g.send(:hello)
