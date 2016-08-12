# The ability to invoke subpatterns recursively means that backreferences can get tricky. Ruby solves this by letting
# you refer to a named or numbered group at a particular level of the recursion—add a +n or -n for a capture at the 
# given level relative to the current level.

# Here’s an example that matches palindromes:

palindrome_matcher = /
\A
  (?<palindrome>
                # nothing, or
   | \w         # a single character, or
   | (?:        # x <palindrome> x
       (?<some_letter>\w)
       \g<palindrome>
       \k<some_letter+0>
    )
  )
\z
/x

# A palindrome is an empty string, a string containing a single character, or a character followed by a palindrome,
# followed by that same character. The notation \k<some_letter+0> means that the letter matched at the end of the
# inner palindrome will be the same letter that was at the start of it. Inside the nesting, however, a different
# letter may wrap the interior palindrome.

p palindrome_matcher.match "madam" # => madam
p palindrome_matcher.match "m"     # => m
p palindrome_matcher.match "adam"  # => nil
