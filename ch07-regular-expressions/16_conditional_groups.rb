# Say you were validating a list of banquet attendees:

# Mr Jones and Sally
# Mr Bond and Ms Moneypenny
# Samson and Delilah
# Dr Jekyll and himself
# Ms Hinky Smith and Ms Jones
# Dr Wood and Mrs Wood
# Thelma and Louise

# The rule is that if the first person in the list has a title, then so should the second. This means that the first and fourth
# lines in this list are invalid.

# We can start with a pattern to match a line with an optional title and a name. We've reached the end of the name when we
# find the word 'and' with spaces around it.

# The regexp is defined with the x (extended) option so we can include whitespace. The ?: modifier on the group that defines 
# the optional title followed by a space stops that group getting captured into $1. We do however capture just the title part.

re = %r{ (?:(Mrs | Mr | Ms | Dr )\s)? (.*?) \s and \s }x

p 'Mr Bond and Ms Monneypenny' =~ re  # => 0
p [ $1, $2 ]                          # => ["Mr", "Bond"]
p 'Samson and Delilah' =~ re          # => 0
p [ $1, $2 ]                          # => [nil, "Samson"]

# To match the second name, we start with the same code as for the first.

re = %r{ (?:(Mrs | Mr | Ms | Dr )\s)? (.*?) \s and \s (?:(Mrs | Mr | Ms | Dr )\s)? (.+) }x

p 'Mr Bond and Ms Monneypenny' =~ re  # => 0
p [ $1, $2, $3, $4 ]                  # => ["Mr", "Bond", "Ms", "Monneypenny"]
p 'Samson and Delilah' =~ re          # => 0 
p [ $1, $2, $3, $4 ]                  # => [nil, "Samson", nil, "Delilah"]

# Clean up the duplication using a named group:

re = %r{ (?:(?<title>Mrs | Mr | Ms | Dr )\s)? (.*?) \s and \s (\g<title>\s)? (.+) }x

p m = re.match('Mr Bond and Ms Monneypenny') # => #<MatchData "Mr Bond and Ms
                                             # .. Monneypenny" title:"Ms">
p [ m[0], m[1] ]

p m = re.match('Samson and Delilah')         # => #<MatchData "Samson and Delilah" title:nil>
p [ m[0], m[1] ]

# This regex also matches a line where the first name has a title and the second doesn't

p m = re.match('Mr Smith and Sally')         # => #<MatchData "Mr Smith and Sally" title:"Mr">
p [ m[0], m[1] ]

# The second test for a title must be mandatory if the first test matches. That's where the
# conditional subpatterns come in. The syntax (?(n)subpattern) will apply the subpattern
# match only if a previous group number n also matched. You can also test named groups using
# the syntaxes (?(<name>)subpattern) or (?('name')subpattern).

# We want to apply a test for the second title if the first title is present. That first
# title is matched by the group named title, so the condition group looks like
# (?<title>...):

re = %r{ (?:(?<title>Mrs | Mr | Ms | Dr )\s)? (.*?) \s and \s (?(<title>)\g<title>\s) (.+) }x

p re.match('Mr Smith and Sally')   # => #<MatchData "Mr Smith and Sally" title:nil>
p [ m[0], m[1] ]

# This didn't work, the match succeeded when we expected it to fail. That's because the regular
# expression applied backtracking. It matched the optional first name,the and,and then was told
# to match a second title (because group 1 matched the first). There's no second title, so the
# match failed. But rather than stopping, the engine went back to explore alternatives.

# It noticed that the first title was optional, and so it tried matching the whole pattern again,
# this time skipping the title. It successfully matched Mr Smith using the (.*?) group, and
# matched Sally with the second name group. So we want to tell it never to backtrack over the
# first name; once it has found a title there, it has to use it. (?> ...) to the rescue:

re = %r{
        ^(?> (?:(?<title>Mrs | Mr | Ms | Dr )\s)?
             (.*?)
             \s and \s
         )
         (?(<title>)\g<title>\s)
         (.+)
}x

p re.match('Mr Smith and Sally')    # => nil

# The match failed, as we expected, but when we add a title to Sally, it succeeds. 
p re.match('Mr Smith and Ms Sally') # => #<MatchData "Mr Smith and Ms Sally"
                                    # .. title:"Ms">

# Let's try this on our list:

DATA.each do |line| 
  if line =~ re
    print "VALID: "
  else
    print "INVALID: "
  end
  puts line
end
__END__
Mr Jones and Sally
Mr Bond and Ms Moneypenny
Samson and Delilah
Dr Jekyll and himself
Ms Hinky Smith and Ms Jones
Dr Wood and Mrs Wood
Thelma and Louise
