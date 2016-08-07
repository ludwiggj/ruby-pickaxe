require_relative 'show_regexp'

# These are often used to anchor a pattern match; for example.

str = "this is\nthe time"

# The patterns ^ and $ match the beginning and end of a line, respectively.
puts show_regexp(str, /^the/) # => this is\n->the<-time
puts show_regexp(str, /is$/)  # => this ->is<-\nthe time

# The sequence \A matches the beginning of a string,
puts show_regexp(str, /\Athis/) # => ->this<-is\nthe time
puts show_regexp(str, /\Athe/)  # => no match

# \z matches the end of a string.
puts show_regexp(str, /ime\z/)   # => this is\nthe t->ime<-
puts show_regexp(str, /slime\z/) # => no match

# \Z also matches the end of a string.
puts show_regexp(str, /ime\Z/)   # => this is\nthe t->ime<-
puts show_regexp(str, /slime\Z/) # => no match

# Actually, \Z matches the end of a string unless the string
# ends with \n, in which case it matches just before the \n.
puts show_regexp("This is the time\n", /time\Z/) # => This is the ->time<-\n

# \b and \B match word boundaries and non-word boundaries, respectively.
# Word characters are ASCII letters, numbers, and underscores:

puts show_regexp("this is\nthe time", /\bis/) # => this ->is<-\nthe time
puts show_regexp("this is\nthe time", /\Bis/) # => th->is<- is\nthe time
