# The Ruby operator =~ matches a string against a pattern.
# It returns the character offset into the string at which the match occurred:

# /cat/ Matches 'dog and cat' and 'catch' but not 'Cat' or 'c.a.t.'
p /cat/ =~ 'dog and cat' # => 8
p /cat/ =~ 'catch'       # => 0
p /cat/ =~ 'Cat'         # => nil
p /cat/ =~ 'c.a.t'       # => nil

# /123/ matches '86512312' and 'abc123' but not '1.23' 
p /123/ =~ '86512312'    # => 3
p /123/ =~ 'abc123'      # => 3
p /123/ =~ '1.23'        # => nil

# /t a b/ matches 'hit a ball' but not 'table'
p /t a b/ =~ 'hit a ball'  # => 2
p /t a b/ =~ 'table'       # => nil

# You can put the string first if you prefer:
p 'dog and cat' =~ /cat/ # => 8 
p 'catch' =~ /cat/       # => 0
p 'Cat' =~ /cat/         # => nil

# Blackslash escapes special characters, like * and /
p /\*/ =~ '2 * 2 is 4'     # => 2
p /\// =~ '2 / 2 is 1'     # => 2

# Inside a pattern, all characters except ., |, (, ), [, ], {, }, +,
# /, \, ^, $, *, and ? match themselves. The exceptions need to be
# escaped.

p /\./ =~ 'The end is nigh...'              # => 15
p /\|/ =~ 'We\'re in the | 5 by 5'          # => 13
p /\(/ =~ 'It\'s an ('                      # => 8
p /\)/ =~ 'and ) case.'                     # => 4
p /\[/ =~ 'It\'s hip ['                     # => 9
p /\]/ =~ '] to be square'                  # => 0
p /\{/ =~ '{ Curly'                         # => 0
p /\}/ =~ 'Wurly }'                         # => 6
p /\+/ =~ '2+2=4'                           # => 1
p /\\/ =~ '\\guitarist'                     # => 0, note \\ is needed to produce a single backslash
p /\^/ =~ 'the h^t on the c^t'              # => 5
p /\$/ =~ 'I need a $'                      # => 9
p /\?/ =~ '2b r not 2b? Dat is de question' # => 11
