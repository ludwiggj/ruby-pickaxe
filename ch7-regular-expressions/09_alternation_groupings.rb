require_relative 'show_regexp.rb'

# An unescaped vertical bar, |, matches either the construct that precedes it or the construct
# that follows it:

a = 'red ball blue sky' 
puts show_regexp(a, /d|e/)                 # => r->e<-d ball blue sky
puts show_regexp(a, /al|lu/)               # => red b->al<-l blue sky
puts show_regexp(a, /red ball|angry sky/)  # => ->red ball<- blue sky

# Note that | has a very low precedence.
# The last example matches red ball or angry sky, not red ball sky or red angry sky.
# To match red ball sky or red angry sky, you need to override the default 
# precedence using grouping.

# Use parentheses to group terms within a regular expression. Everything within the
# group is treated as a single regular expression.

# This matches an 'a' followed by one or more 'n's
puts show_regexp('banana', /an+/)   # => b->an<-ana

# This matches the sequence 'an' one or more times 
puts show_regexp('banana', /(an)+/) # => b->anan<-a

puts show_regexp(a, /blue|red/)             # => ->red<-ball blue sky 
puts show_regexp(a, /(blue|red) \w+/)       # => ->red ball<-blue sky
puts show_regexp(a, /(red|blue) \w+/)       # => ->red ball<-blue sky 
puts show_regexp(a, /red|blue \w+/)         # => ->red<-ball blue sky 
puts show_regexp(a, /red (ball|angry) sky/) # => no match

a = 'the red angry sky'

puts show_regexp(a, /red (ball|angry) sky/) # => the ->red angry sky<

# Parentheses also collect the results of pattern matching. Ruby counts
# opening parentheses and for each stores the result of the partial
# match between it and the corresponding closing parenthesis. You can
# use this partial match both within the rest of the pattern and in
# your Ruby program. Within the pattern, the sequence \1 refers to the
# match of the first group, \2 the second group, and so on. Outside the
# pattern, the special variables $1, $2, and so on, serve the same purpose. 

/(\d\d):(\d\d)(..)/ =~ '12:50am'           # => 0 
puts "Hour is #$1, minute #$2, in the #$3" # => "Hour is 12, minute 50, in the am"

/((\d\d):(\d\d))(..)/ =~ '12:51am' # => 0 
puts "Time is #$1"                 # => "Time is 12:51"
puts "Hour is #$2, minute #$3"     # => "Hour is 12, minute 51"
puts "AM/PM is #$4"                # => "AM/PM is am"

# If you're using the MatchData object returned by the match method,
# you can index into it to get the corresponding subpatterns:

md = /(\d\d):(\d\d)(..)/.match("12:52am")

# Note that the first index is 1! 
puts "Hour is #{md[1]}, minute #{md[2]} in the #{md[3]}" # => "Hour is 12, minute 52 in the am"

md = /((\d\d):(\d\d))(..)/.match("12:53am")
puts "Time is #{md[1]}"                  # => "Time is 12:53"
puts "Hour is #{md[2]}, minute #{md[3]}" # => "Hour is 12, minute 53"
puts "AM/PM is #{md[4]}"                 # => "AM/PM is am"

# The ability to use part of the current match later in that match allows you
# to look for various forms of repetition:

# match duplicated letter
puts show_regexp('He said "Hello"', /(\w)\1/) # => He said "He->ll<-o"

# match duplicated substrings
puts show_regexp('Mississippi', /(\w+)\1/)    # => M->ississ<-ippi

# Can also use names to refer to previously matched content.

# match duplicated letter
str = 'He said "Hello"'
puts show_regexp(str, /(?<char>\w)\k<char>/) # => He said "He->ll<-o"

# match duplicated adjacent substrings
str = 'Mississippi'
puts show_regexp(str, /(?<seq>\w+)\k<seq>/)  # => M->ississ<-ippi

# Named matches are also available as local variables, but only if you
# use a literal regexp and that literal appears on the left hand side
# of the =~ operator i.e. it doesn't work if you assign a regex object
# to a variable and then match it against a string.
/(?<hour>\d\d):(?<min>\d\d)(..)/ =~ "12:54am" # => 0
puts "Hour is #{hour}, minute #{min}" # => "Hour is 12, minute 54"

# You can mix named and position-based references
puts "Hour is #{hour}, minute #{$2}"  # => "Hour is 12, minute 54"
