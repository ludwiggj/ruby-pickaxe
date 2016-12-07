require_relative 'show_regexp'

# You can also match before the pattern using (?<=re) (zero-width positive lookbehind).
# This lets you look for characters that precede the context of a match without
# affecting $&.

# The following example matches the letters dog but only if they are preceded by the
# letters hot:

puts show_regexp("seadog hotdog", /(?<=hot)dog/) # => seadog hot->dog<-

# For the lookbehind extension, re either must be a fixed length or consist of a set
# of fixed length alternatives. That is, (?<=aa) and (?<=aa|bbb) are valid, but
# (?<=a+b) is not.

# There is also a negated version, (?<!re), which is true if the context is not present.

puts show_regexp("seadog hotdog", /(?<!hot)dog/) # => sea->dog<- hotdog

# The \K sequence is related to backtracking. If included in a pattern, it doesn't
# affect the matching process. However, when the matched string is stored in $& or
# \&, only the text to the right of the \K is captured.

puts show_regexp("thx1138", /[a-z]+\K\d+/)   # => thx->1138<

# This is equivalent to, but more genrrsl than:
puts show_regexp("thx1138", /(?<=[a-z])\d+/) # => thx->1138<-
