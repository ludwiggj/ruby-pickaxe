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

# We can start with a pattern to match a line with an optional title and a name. We know we’ve reached the end of the name when
# we find the word 'and' with spaces around it.

# The regexp is defined with the x (extended) option so we can include whitespace. We also used the ?: modifier on the group
# that defines the optional title followed by a space. This stops that group getting captured into $1. We do however capture
# just the title part.

re = %r{ (?:(Mrs | Mr | Ms | Dr )\s)? (.*?) \s and \s }x

p 'Mr Bond and Ms Monneypenny' =~ re  # => 0
p [ $1, $2 ]                          # => ["Mr", "Bond"]
p 'Samson and Delilah' =~ re          # => 0
p [ $1, $2 ]                          # => [nil, "Samson"]

# So now we need to match the second name. We can start with the same code as for the first.

re = %r{ (?:(Mrs | Mr | Ms | Dr )\s)? (.*?) \s and \s (?:(Mrs | Mr | Ms | Dr )\s)? (.+) }x

p 'Mr Bond and Ms Monneypenny' =~ re  # => 0
p [ $1, $2, $3, $4 ]                  # => ["Mr", "Bond", "Ms", "Monneypenny"]
p 'Samson and Delilah' =~ re          # => 0 
p [ $1, $2, $3, $4 ]                  # => [nil, "Samson", nil, "Delilah"]

# Clean up the duplication using a named group:

re = %r{ (?:(?<title>Mrs | Mr | Ms | Dr )\s)? (.*?) \s and \s (\g<title>\s)? (.+) }x

p m = re.match("Mr Bond and Ms Monneypenny") # => #<MatchData "Mr Bond and Ms
                                             # .. Monneypenny" title:"Ms">
p [ m[0], m[1] ]

p m = re.match("Samson and Delilah")         # => #<MatchData "Samson and Delilah"
                                             # .. title:nil>
p [ m[0], m[1] ]
