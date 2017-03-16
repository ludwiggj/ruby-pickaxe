p $0
ARGV.each {|arg| p arg }

# ruby -w test.rb "Hello World" a1 1.6180
#
#
# If your program reads from standard input (or uses the special object ARGF, described in the
# next section), the arguments in ARGV will be taken to be filenames, and Ruby will read from
# these files. If your program takes a mixture of arguments and filenames, make sure you
# empty the nonfilename arguments from the ARGV array before reading from the files.
