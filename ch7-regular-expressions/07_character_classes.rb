# encoding: UTF-8
require_relative 'show_regexp'

# A character class is a set of characters between brackets:
# [characters] matches any single character between the brackets.

# [aeiou] matches a vowel:
puts show_regexp('Price $12.', /[aeiou]/) # => Pr->i<-ce $12.

# [,.:;!?] matches some punctuation,
puts show_regexp('Romeo! Wherefore art thou?', /[,.:;!?]/) # => Romeo->!<- Wherefore art thou?

# The significance of the special regular expression characters .|(){+^$*? is turned off 
# inside the brackets.
puts show_regexp('The buck stops here. Or does it?', /./)   # => ->T<-he buck stops here. Or does it?
puts show_regexp('The buck stops here. Or does it?', /\./)  # => The buck stops here->.<- Or does it? 
puts show_regexp('The buck stops here. Or does it?', /[.]/) # => The buck stops here->.<- Or does it? 

# However, normal string substitution still occurs, so (for example) 
# \b represents a backspace character, and \n represents a newline/
puts show_regexp("The \buck stops here. Or does it?", /[.\b]/) # => The ->\b<-uck stops here. Or does it? 

# [c1-c2] represents all the characters from c1 to c2 in the current encoding:
a = 'see [The PickAxe-page 123]'
puts show_regexp(a, /[A-F]/)      # => see [The Pick->A<-xe-page 123]
puts show_regexp(a, /[A-Fa-f]/)   # => s->e<-e [The PickAxe-page 123]
puts show_regexp(a, /[0-9]/)      # => see [The PickAxe-page ->1<-23]
puts show_regexp(a, /[0-9][0-9]/) # => see [The PickAxe-page ->12<-3]

# ^ negates a character class when used immediately after the opening bracket:
puts show_regexp('Price $13.', /[^A-Z]/)      # => P->r<-ice $13. 
puts show_regexp('Price $14.', /[^\w]/)       # => Price-> <-$14.
puts show_regexp('Price $15.', /[a-z][^a-z]/) # => Pric->e <-$15.

# Some character classes are used so frequently that Ruby provides abbreviations
# for them. They may be used both within brackets and in the body of a pattern.

# The following list assumes the default Ruby regex mode.

# \s whitespace character [ \t\r\n\f]
puts show_regexp('It costs $16.', /\s/)        # => It-> <-costs $16.
puts show_regexp("Price\t$17. Cheap!", /[\s]/) # => matches the tab character \t. 

# \S Any character except whitespace
puts show_regexp('It costs $18.', /\S/)        # => ->I<-t costs $18.

# \d matches any decimal digit
puts show_regexp('It costs $19.', /\d/)        # => It costs $->1<-9.

# \D Any character except a decimal digit
puts show_regexp('2468who-do-we-appreciate?', /\D/) # => 2468->w<-ho-do-we-appreciate?

# \h Hexadecimal digit character [0-9a-fA-F]
puts show_regexp('who put the hex on hex?', /\h/)   # => who put th->e<- hex on hex?

# \H Any character except a hex digit
puts show_regexp('who put the hex on hex?', /\H/)   # => ->w<-ho put the hex on hex?

# \R A generic linebreak sequence. May match the two characters \r\n.
puts show_regexp("  who put the hex on hex?\r", /\R/)       # => matches
puts show_regexp("    who put the hex on hex?\n", /\R/)     # => matches
puts show_regexp("      who put the hex on hex?\r\n", /\R/) # => matches

# \w A word character (really, a programming language identifier) [a-zA-Z0-9_] 
puts show_regexp('        who put the hex on hex?', /\w/) # =>         ->w<-ho put the hex on hex?

# \W Any character except a word character
puts show_regexp('        who put the hex on hex?', /\W/) # => -> <-     w<-ho put the hex on hex?

# Some of the character classes have different interpretations depending on the character
# set option (?option) defined for the regular expression:

# d The default, operates as per Ruby 1.9
# a ASCII-only support e.g. word characters are just the ASCII alphanumerics, 
# u Full Unicode support e.g. word characters are extended to include Unicode
#   letters, marks, numbers, and connection punctuation.

# uber examples, will need to try on a mac!
# puts "\u2713".encode("utf-8")
# puts "\u0252".encode("utf-8")
# puts show_regexp("\u0252ber.".encode("utf-8"), /(?a)\w+/) # => ü->ber<-.

# show_regexp("über.", /(?a)\w+/) # => ü->ber<-.
# show_regexp("über.", /(?d)\w+/) # => ü->ber<-.
# show_regexp("über.", /(?u)\w+/) # => ->über<-.
# show_regexp("über.", /(?d)\W+/) # => ->ü<-ber.
# show_regexp("über.", /(?u)\W+/) # => über->.<

# The POSIX character classes, can also be negated by putting a caret after the first colon:
puts show_regexp('Price $20.', /[aeiou]/)          # => Pr->i<-ce $20.
puts show_regexp('Price $21.', /[[:digit:]]/)      # => Price $->2<-1.
puts show_regexp('Price $22.', /[[:space:]]/)      # => Price-> <-$22.
puts show_regexp('Price $23.', /[[:^alpha:]]/)     # => Price-> <-$23.
puts show_regexp('Price $24.', /[[:punct:]aeiou]/) # => Pr->i<-ce $24.

# Literal characters [] and - need to be escaped in a character class:

a = 'see [The PickAxe-page 123]'
puts show_regexp(a, /[\]]/) # => see [The PickAxe-page 123->]<-
puts show_regexp(a, /[\[]/) # => see ->[<-The PickAxe-page 123]
puts show_regexp(a, /[0-9\]]/) # => see [The PickAxe-page ->1<-23]
puts show_regexp(a, /[\d\-]/) # => see [The PickAxe->-<-page 123]

# Use && to intersect character classes.

# Match all lower case ASCII letters that aren't vowels:

str = 'now is the time'

puts str.gsub(/[a-z&&[^aeiou]]/, '*') # => "*o* i* **e *i*e" 

# Use \p construct to match characters with a particular Unicode property 

# encoding: utf-8
# Try on mac....
# string = "∂y/∂x = 2πx"
# show_regexp(string, /\p{Alnum}/) # => ∂->y<-/∂x = 2πx
# show_regexp(string, /\p{Digit}/) # => ∂y/∂x = ->2<-πx
# show_regexp(string, /\p{Space}/) # => ∂y/∂x-> <-= 2πx
# show_regexp(string, /\p{Greek}/) # => ∂y/∂x = 2->π<-x
# show_regexp(string, /\p{Graph}/) # => ->∂<-y/∂x = 2πx 

# A . appearing outside brackets represents any character except a
# newline (though in multiline mode it matches a newline, too):

a = 'It costs $25.'
puts show_regexp(a, /c.s/) # => It ->cos<-ts $25.
puts show_regexp(a, /./)   # => ->I<-t costs $25.
puts show_regexp(a, /\./)  # => It costs $25->.<

# Contrast with behaviour of . inside square brackets, where it matches punctuation only.
puts show_regexp("Romeo. Wherefore art thou?", /[.]/)  # => Romeo->.<- Wherefore art thou?
puts show_regexp("Romeo. Wherefore art thou?", /[\.]/) # => Romeo->.<- Wherefore art thou?
