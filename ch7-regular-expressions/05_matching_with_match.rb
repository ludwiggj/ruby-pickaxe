require_relative 'show_regexp'

name = 'Fats Waller'

puts /a/.match (name)                 # => #<MatchData "a">
match = Regexp.new('all').match(name) # => #<MatchData "all">
puts match

# The match method returns a MatchData object for a successful match.
# After a successful match, Ruby sets a whole bunch of magic variables.

# For example:

#   $& receives the part of the string that was matched by the pattern,
#   $` receives the part of the string that preceded the match, and
#   $' receives the string after the match.

puts "pre:#{$`}: match:#{$&}: post:#{$'}:"

# However, these particular variables are considered to be fairly ugly.
# Most Ruby programmers instead use the MatchData object directly.

puts "pre:#{match.pre_match}: match:#{match[0]}: post:#{match.post_match}:"

# If the match fails, nil is returned.
p /Z/.match (name)              # => nil

puts show_regexp('very interesting', /t/) # => very in->t<-eresting
puts show_regexp('Fats Waller', /lle/)    # => Fats Wa->lle<-r
puts show_regexp('Fats Waller', /z/)      # => no match

# Examples with escaped characters
puts show_regexp('yes | no', /\|/)        # => yes ->|<-no
puts show_regexp('yes (no)', /\(no\)/)    # => yes ->(no)<-
puts show_regexp('are you sure?', /e\?/)  # => are you sur->e?<-
