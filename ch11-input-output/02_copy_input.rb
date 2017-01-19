# ruby 02_copy_input.rb                     # => Reads from standard input and repeats to standard output
# ruby 02_copy_input.rb testfile1           # => Reads from testfile1 and repeats to standard output
# ruby 02_copy_input.rb testfile1 testfile2 # => Reads from testfile1 and 2 in turn and repeats to standard output

while line = gets
  puts line
end
