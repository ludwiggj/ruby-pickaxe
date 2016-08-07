# Xs can be represented as X+, and you can use a lookahead to check that it isn't
# followed by an O, so you code up the pattern /(X+)(?!O)/. Let's try it:

re = /(X+)(?!O)/

# This one works
p re =~ 'test XXXY' # => 5
p $1                # => "XXX"

# But, unfortunately, so does this one

p re =~ "test XXXO" # => 5
p $1 # => "XX"

# This is due to backtracking - when a match fails, the engine goes back and tries to match
# a different way.

# But this wasn't the intent of our regexp. Once it finds a sequence of Xs, those Xs should
# be locked away. We don't want one of them being the terminator of the pattern. We can get 
# that behavior by telling Ruby not to backtrack once it finds a string of Xs. There are a
# couple of ways of doing this.

# (1) The sequence (?>re) nests an independent regular expression within the first regular
# expression. This expression is anchored at the current match position. If it consumes
# characters, these will no longer be available to the higher-level regular expression.
# This construct therefore inhibits backtracking.

re = /((?>Y+))(?!O)/

# This one works:
p re =~ "test YYYZ" # => 5 
p $1                # => "YYY" 

# Now this doesn't match:
p re =~ "test YYYO" # => nil 
p $1                # => nil

# And this finds the second string of Ys
p re =~ "test YYYO YYYYZ" # => 10
p $1                      # => "YYYY"

# (2) Use a third form of repetition.
#     a) greedy repetition, re+
#     b) lazy repetition, re+?
#     c) possessive repetition, re++

# Possessive repetition behaves just like greedy repetition, consuming as much of the string
# as it can. But once consumed, that part of the string can never be re-examined by the
# pattern. The regular expression engine can't backtrack past a possessive qualifier.

re = /(Z++)(?!O)/

p re =~ "test ZZZA" # => 5
p $1                # => "ZZZ"

p re =~ "test ZZZO" # => nil 
p $1                # => nil

p re =~ "test ZZZO ZZZZA" # => 10 
p $1                      # => "ZZZZ"
