# You'll sometimes want to match a pattern only if the matched substring is preceded by or followed
# by some other pattern. That is, you want to set some context for your match but don't want to
# capture that context as part of the match.

# For example, you might want to match every word in a string that is followed by a comma, but you
# don't want the comma to form part of the match.

# The zero-width positive lookahead extension (?=re) matches re at this point but does not consume
# it; you can look forward for the context of a match without affecting $&.

# In this example, we'll use scan to pick out the words:

str = "red, white, and blue"
p str.scan(/[a-z]+(?=,)/) # => ["red", "white"]

# There is a negated versions,(?!re) which is true if the context is not
# present in the target string.

p str.scan(/[a-z]+(?!,)/) # => ["re", "whit", "and", "blue"]

