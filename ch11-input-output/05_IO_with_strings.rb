# There are often times where you need to work with code that assumes it’s reading from or writing to one or more files.
# But you have a problem: the data isn’t in files. Perhaps it’s available instead via a SOAP service, or it has been
# passed to you as command-line parameters. Or maybe you’re running unit tests, and you don’t want to alter the real
# file system.

# Enter StringIO objects. They behave just like other I/O objects, but they read and write strings, not files. If you
# open a StringIO object for reading, you supply it with a string. All read operations on the StringIO object then read
# from this string. Similarly, when you want to write to a StringIO object, you pass it a string to be filled.

require 'stringio'

ip = StringIO.new("now is\nthe time\nto learn\nRuby!")

op = StringIO.new("", "w")

ip.each_line do |line|
  puts "Processing [#{line}]"
  op.puts line.reverse
end

puts op.string # => "\nsi won\n\nemit eht\n\nnrael ot\n!ybuR\n"
