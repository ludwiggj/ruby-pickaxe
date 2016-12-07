# The sequences \n (where n is a number), \k'n', and \k<n> all refer to the nth captured subpattern.

# The following expressions all match six characters with the first three characters being the same as the last three.

str = 'ziperdee doodoo dah day'

str =~ /(...)\1/
puts $1          # doo

str =~ /(...)\k'1'/
puts $1          # doo

str =~ /(...)\k<1>/
puts $1          # doo

# Subpatterns can also be named using either of the syntaxes (?<name>...) or (?'name'...).
# You then refer to these named captures using either \k<name> or \k'name'.

# The following shows different ways of matching a time range (in the form hh:mm-hh:mm) where the hour part is the same:

same = '12:15-12:45'
differ = '12:45-13:15'

# use numbered backreference

pattern = /(\d\d):\d\d-\1:\d\d/

p same =~ pattern                 # => 0
p $1                              # => 12

p differ =~ /(\d\d):\d\d-\1:\d\d/ # => nil

# use named backreference
p same =~ /(?<hour>\d\d):\d\d-\k<hour>:\d\d/   # => 0
p $1                                           # => 12

p differ =~ /(?'hour'\d\d):\d\d-\k'hour':\d\d/ # => nil

# Negative backreference numbers count backward from the place they’re used.

# The following pattern matches four-letter palindromes (words that read the same forward and backward).
p 'abab' =~ /(.)(.)\k<-1>\k<-2>/ # => nil
p 'abba' =~ /(.)(.)\k<-1>\k<-2>/ # => 0

p "#{$1} #{$2}"                  # => "a b". Note that the order of $1 and $2 are the opposite of what you would expect

# You can invoke a named subpattern using \g<name> or \g<number>. Note that this reexecutes the match in the subpattern,
# in contrast to \k<name>, which matches whatever is matched by the subpattern:

re = /(?<color>red|green|blue) \w+ \g<color> \w+/

p re =~ 'red sun white moon' # => nil

p re =~ 'red sun blue moon'  # => 0
p "#{$1} #{$2}"              # => "blue " Note that only the last match is stored in $1 i.e. $2 returns nothing

re = /(red|green|blue) \w+/
p re =~ 'red sun blue moon'  # => 0
p "#{$1} #{$2}"              # => "red "

p 'red sun blue moon'.scan(re)  # => [["red"], ["blue"]] 
p "#{$1} #{$2}"                 # => "blue " Note that only the last match is stored in $1 i.e. $2 returns nothing

# \g can be used recursively to invoke a pattern within itself. The following code matches a string in which braces are
# properly nested. The x option allows the expression to be written with lots of space. Comments can also be added.

# You can read this regular expression as follows: a brace expression is an open brace, then a sequence of zero or more
# characters or brace expressions, and then a closing brace.

re = /
  \A
    (?<brace_expression>
      {
        (
          [^{}]                 # anything other than braces
        |                       # ...or...
          \g<brace_expression>  # a nested brace expression
        )*
      }
    )
  \Z
/x

p re =~ '{ This expression { is } ok as { the number } of braces match}'

p re =~ '{ This expression { is not } ok as { the number } of braces does not match'
