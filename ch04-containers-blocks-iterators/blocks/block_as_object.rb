def create_block_object(&block)
  block
end

bo = create_block_object { |param| puts "You called me with #{param}" }

bo.call 99    # => You called me with 99
bo.call "cat" # => You called me with cat

# This is so useful that Ruby provides two built-in methods that convert a block to an object.
# Both lambda and Proc.new take a block and return an object of class Proc.

bol = lambda { |param| puts "You called me with #{param}" }

bol.call 999   # => You called me with 999
bol.call "dog" # => You called me with dog

bop = Proc.new { |param| puts "You called me with #{param}" }

bop.call 9999    # => You called me with 9999
bop.call "bunny" # => You called me with bunny
