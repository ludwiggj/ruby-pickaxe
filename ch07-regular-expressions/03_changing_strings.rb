str = 'Dog and Cat'

new_str = str.sub(/Cat/, 'Gerbil')

puts "Let's go to the #{new_str} for a pint."

# The sub method changes only the first match it finds.
new_str1 = str.sub(/a/, '*')
puts "Using sub: #{new_str1}"

# The gsub method replaces all matches. (The g stands for global.)
new_str2 = str.gsub(/a/, '*')
puts "Using gsub: #{new_str2}"

# Both sub and gsub return a new string.

# If no substitutions are made, the new string will just be a copy of the original.
puts str.sub(/snake/, 'worm')
puts str.gsub(/snake/, 'worm')

# To modify the original string, use the sub! and gsub! forms:
str = 'now is the time'
puts str.sub!(/i/, '*')
puts str.gsub!(/t/, 'T')

# For sub! and gsub!, if no substitutions are made, nil is returned
p 'Dog and Cat'.sub!(/toad/, 'newt')
p 'Dog and Cat'.gsub!(/toad/, 'newt')

# The sub and gsub methods work equally well if the pattern contains
# repetition, alternation, and grouping.

a = 'quick brown fox'
puts a.sub(/[aeiou]/, '*')  # => "q*ick brown fox"
puts a.gsub(/[aeiou]/, '*') # => "q**ck br*wn f*x"
puts a.sub(/\s\S+/, '')     # => "quick fox"
puts a.gsub(/\s\S+/, '')    # => "quick"

# The substitution methods can also take a block. It is passed the matching
# substring, and the block's value is substituted into the original string.

a = 'quick brown fox'
puts a.sub(/^./) {|match| match.upcase } # => "Quick brown fox" 
puts a.gsub(/[aeiou]/) {|vowel| vowel.upcase } # => "qUIck brOwn fOx"

# An example: normalize names entered by users in to a web application. The
# following method is a simple first iteration. The pattern that matches
# the first character of a word is \b\wâi.e. a word boundary followed by a
# word character.

def mixed_case(name)
  name.downcase.gsub(/\b\w/) {|first| first.upcase }
end

puts mixed_case('DAVE THOMAS') # => "Dave Thomas"
puts mixed_case('dave thomas') # => "Dave Thomas"
puts mixed_case('dAvE tHoMas') # => "Dave Thomas"

# There's an idiomatic way to write the substitution in Ruby 1.9,
# which uses the Symbol.to_proc Trick:

def mixed_case(name)
  name.downcase.gsub(/\b\w/, &:upcase)
end

puts mixed_case('dAvE tHoMas') # => "Dave Thomas"

# sub and gsub can also receive a hash as the replacement parameter, in which
# case they will look up matched groups and use the corresponding values as
# replacement text:

replacement = { 'cat' => 'feline', 'dog' => 'canine' }
replacement.default = 'unknown'
puts 'cat and dog'.gsub(/\w+/, replacement) # => "feline unknown canine"

# Can also use backslash sequences in the substitution 
puts 'fred:smith'.sub(/(\w+):(\w+)/, '\2, \1') # => smith, fred
puts 'nercpyitno'.gsub(/(.)(.)/, '\2\1')       # => encryption

# You can also reference named groups
puts 'fred:smith'.sub(/(?<first>\w+):(?<last>\w+)/, '\k<last>, \k<first>') # => smith, fred
puts 'nercpyitno'.gsub(/(?<c1>.)(?<c2>.)/, '\k<c2>\k<c1>')                 # => encryption

# Additional backslash sequences work in substitution strings:
# \& (last match)
# \+ (last matched group)
# \` (string prior to match)
# \' (string after match)
# \\ (a literal backslash)

puts '1 and 2'.gsub(/\sand\s/, '[\`]') # => 1[1]2
puts '1 and 2'.gsub(/\sand\s/, '[\&]') # => 1[ and ]2

# This version doesn't work
puts '1 and 2'.gsub(/\sand\s/, '[\']') # => 1[']2

# This does
puts '1 and 2'.gsub(/\sand\s/, %q[[\']])     # => 1[2]2

puts '1 and 2'.gsub(/\sand\s/, %q[[\'\&\`]]) # => 1[2 and 1]2

# These versions (with single quotes) work
puts '1 and 2'.gsub(/\d/, '\& is \&')   # => 1 is 1 and 2 is 2
puts '1 and 2'.gsub(/(\d)/, '\+ is \+') # => 1 is 1 and 2 is 2

# These versions (with double quotes) don't work!
# This is because the escaped characters in double-quoted strings are evaluated 
puts '1 and 2'.gsub(/\d/, "\& is \&")
puts '1 and 2'.gsub(/(\d)/, "\+ is \+")

# It gets confusing if you want to include a literal backslash in a substitution.

# Trying to replace each backslash with two:

puts 'The date is 4\8\16'
puts 'The date is 4\8\16'.gsub(/\\/, '\\\\')

# The \\\\ is programmer converted to \\ in syntax analysis. However, when the
# substitution occurs, the regular expression engine performs another pass
# through the string, converting \\ to \, so the net effect is to replace each
# single backslash with another single backslash.

# Thus you need 8 backslashes

puts 'The date is 4\8\16'.gsub(/\\/, "\\\\\\\\")

# Using the fact that \& is replaced by the matched string, you could also write this:

str = 'a\b\c'               # => "a\b\c"
puts str.gsub(/\\/, '\&\&') # => "a\\b\\c"

# If you use the block form of gsub, the string for substitution is analyzed only once
# (during the syntax pass), and the result is what you intended:

str = 'a\b\c'                  # => "a\b\c"
puts str.gsub(/\\/) { '\\\\' } # => "a\\b\\c"
