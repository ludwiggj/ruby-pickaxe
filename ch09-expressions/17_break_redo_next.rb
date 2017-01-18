=begin

break terminates the immediately enclosing loop; control resumes at the statement following
the block. redo repeats the current iteration of the loop from the start but without reevaluating
the condition or fetching the next element (in an iterator). next skips to the end of the loop,
effectively starting the next iteration:

while line = gets
  next if line =~ /^\s*#/ # skip comments
  break if line =~ /^END/ # stop at end
  # substitute stuff in backticks and try again
  redo if line.gsub!(/`(.*?)`/) { eval($1) }
  # process line ...
end

=end

# These keywords can also be used within blocks. Although you can use them with any block,
# they typically make the most sense when the block is being used for iteration:
i=0

loop do         # => 345
  i += 1
  next if i < 3
  print i
  break if i > 4
end

i = 0

loop do         # => 45
  i += 1
  next if i < 3
  redo if i == 3
  print i
  break if i > 4
end

# A value may be passed to break and next. When used in conventional loops, it probably makes
# sense only to do this with break, where it sets the value returned by the loop. (Any value
# given to next is effectively lost.) If a conventional loop doesn’t execute a break, its
# value is nil.

# result = while line = gets
#            break(line) if line =~ /answer/
#          end

# process_answer(result) if result

i = 0

result = loop do
  i += 1
  next if i < 3
  redo if i == 3
  print i
  break(i*2) if i > 4
end

print result # =>  # => 10
