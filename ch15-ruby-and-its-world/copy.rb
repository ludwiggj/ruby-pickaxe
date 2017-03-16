# ARGF.filename   : name of the file currently being read from
# ARGF.file       : the current File object
# ARGF.lineno     : the total number of lines read
# ARGV.file.lineno: the line number in the current file

while line = gets
  printf "%d: %10s[%d] %s", ARGF.lineno, ARGF.filename, ARGF.file.lineno, line
end

# If you read from ARGF (for example by calling ARGF.gets) or from standard input (for example
# by calling plain gets), Ruby will open the file whose name is the first element of ARGV and
# perform the I/O on it. If, as you continue to read, you reach the end of that file, Ruby closes
# it, shifts it out of the ARGV array, and then opens the next file in the list. At some point, when
# you finishing reading from the last file, ARGV will return an end-of-file condition (so gets will
# return nil, for example).

# ruby copy.rb testfile otherfile

# If ARGV is initially empty, ARGF will read from standard input.

# ruby copy.rb
