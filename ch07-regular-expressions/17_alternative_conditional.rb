# Conditional subpatterns can also have an else clause.

# (?(group_id) true-pattern | fail-pattern )

# If the identified group was previously matched, the true pattern is applied. If it failed,
# the fail pattern is applied. Here's a regular expression that deals with red or blue balls
# or buckets. The colors of the ball and bucket must be different.
# If the first group, the red alternative, matched, then the conditional subpattern is blue,
# otherwise it is red.
re = %r{(?:(red)|blue) ball and (?(1)blue|red) bucket}

p re.match("red ball and blue bucket")  # => #<MatchData "red ball and blue bucket" 1:"red">
p re.match("blue ball and red bucket")  # => #<MatchData "blue ball and red bucket" 1:nil>
p re.match("blue ball and blue bucket") # => nil 
