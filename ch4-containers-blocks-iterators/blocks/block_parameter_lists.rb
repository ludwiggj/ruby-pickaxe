proc1 = lambda do |a, *b, &block|
  puts "a = #{a.inspect}" # => 1
  puts "b = #{b.inspect}" # => [2, 3, 4]
  block.call              # => in block 1
end

proc1.call(1, 2, 3, 4) { puts "in block1" }

# Terse lamba syntax
proc2 = -> a, *b, &block do
  puts "a = #{a.inspect}" # => 1
  puts "b = #{b.inspect}" # => [2, 3, 4]
  block.call              # => in block 2
end

proc2.call(1, 2, 3, 4) { puts "in block2" }
