3.times do
  print "Ho! "    # => Ho! Ho! Ho!
end

0.upto(9) do |x|
  print x, " "    # => 0 1 2 3 4 5 6 7 8 9
end

0.step(12, 3) {|x| print x, " " }  # => 0 3 6 9 12

# Similarly, iterating over arrays and other containers is easy if you use their each method:
[1, 1, 2, 3, 5].each {|val| print val, " "} # => 1 1 2 3 5

# Returns each line of a file, iterating over only those lines that end with a d:
File.open("ordinal.txt").grep(/d$/) do |line| # => second
  puts line                                   #    third
end
