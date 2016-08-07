require_relative 'show_regexp'

a = 'The moon is made of cheese'

# r+ matches one or more occurrences of r; by default the match is greedy
puts show_regexp(a, /\w+/)  # => ->The<- moon is made of cheese

# ? makes the match lazy
puts show_regexp(a, /\w+?/) # => ->T<-he moon is made of cheese

# r* matches zero or more occurrences of r
puts show_regexp(a, /\s.*\s/)    # => The-> moon is made of <-cheese

# Lazy version
puts show_regexp(a, /\s.*?\s/)   # => The-> moon <-is made of cheese 

# r? matches zero or one occurrence of r
puts show_regexp(a, /T?/)        # => ->T<-he moon is made of cheese
puts show_regexp(a, /z?/)        # => -><-The moon is made of cheese

# ? is greedy by default
puts show_regexp(a, /moo?/)      # => The ->moo<-n is made of cheese

# ?? is the lazy version
puts show_regexp(a, /moo??/)     # => The ->mo<-on is made of cheese

# r{m,n} matches at least m and at most n occurrences of r
puts show_regexp(a, /[aeiou]{2,99}/) # => The m->oo<-n is made of cheese

# r{m,} matches at least m occurrences of r
puts show_regexp(a, /ch[e]{1,}/)      # => The moon is made of ->chee<-se

# Lazy version
puts show_regexp(a, /ch[e]{1,}?/)     # => The moon is made of ->che<-ese

# r{,n} matches at most n occurrences of r
puts show_regexp(a, /ch[e]{,2}/)      # => The moon is made of ->chee<-se

# Lazy version
puts show_regexp(a, /ch[e]{,2}?/)     # => The moon is made of ->ch<-eese

# r{m} matches exactly m occurrences of r
puts show_regexp(a, /ch[e]{2}/)       # => The moon is made of ->chee<-se

# The * modifier matches zero or more occurrences. We often forget about the zero part.
# A pattern that contains just a * repetition will always match, whatever string you
# pass it. For example, the pattern /a*/ will always match, because every string
# contains zero or more a's.

# both of these match an empty substring at the start of the string
puts show_regexp(a, /m*/)  # => -><-The moon is made of cheese
puts show_regexp(a, /Z*/)  # => -><-The moon is made of cheese
