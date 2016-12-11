puts `date`                 # => "Thu Nov 14 16:31:02 CST 2013\n"
puts `ls`.split[34]         # => "metaprogramming.pml"
puts %x{echo "hello there"} # => "hello there\n"

# Redefining Backquotes. A string in backquotes would "by default" be executed as a command.
# In fact, the string is passed to the method called Object#` (a single backquote). If you
# want, you can override this. This example uses $?, which contains the status of the last
# external process run:

alias old_backquote `

def `(cmd)
  result = old_backquote(cmd)
  if $? != 0
    puts "*** Command #{cmd} failed: status = #{$?.exitstatus}"
  end
  result
end

print `ls -l /etc/passwd`

# -rw-r--r-- 1 root wheel 5253 Oct 31 09:09 /etc/passwd

print `ls -l /etc/wibble`

# ls: /etc/wibble: No such file or directory
# *** Command ls -l /etc/wibble failed: status = 1
