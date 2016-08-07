# A pattern to match a date with either colons or slashes between the day, month, and year. 
# The first form stores the separator character (which can be a slash or a colon) in $2 and $4.

# The %r{...} syntax creates a regex object. This syntax is particularly useful when creating
# patterns that contain forward slashes:

date_regex = %r{(\d+)(/|:)(\d+)(/|:)(\d+)}

"25/12/2010" =~ date_regex
p [$1,$2,$3,$4,$5] # => ["12", "/", "25", "/", "2010"]

"25:12:2010" =~ date_regex
p [$1,$2,$3,$4,$5] # => ["12", "/", "25", "/", "2010"]

# (?:re) makes re into a group without generating backreferences.This is often useful when you
# need to group a set of constructs but don't want the group to set the value of $1 or whatever. 

# This second pattern doesn't store the date separators in external variables.

date_regex = %r{(\d+)(?:/|:)(\d+)(?:/|:)(\d+)}

"25/12/2010" =~ date_regex
p [$1,$2,$3] # => ["25", "12", "2010"]

"25:12:2010" =~ date_regex
p [$1,$2,$3] # => ["25", "12", "2010"]
