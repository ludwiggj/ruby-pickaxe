# single quote escape sequences

# \\ becomes \
puts 'escape using "\\"'

# \' becomes '
puts 'That\'s right' 

puts "Seconds/day:#{24*60*60}"    # => Seconds/day:86400
puts "#{'Ho! '*3}MerryChristmas!" # => Ho!Ho!Ho!MerryChristmas!"
puts "Safe level is #$SAFE"       # => Safe level is 0 [predefined global var]

# String interpolation. If variable is global variable, a class variable,
# or an instance variable then you can omit the braces

class EinsteinParticle

  @@speed_of_light = 3 * 10 ** 8

  def initialize(time)
    @time = time
  end

  def report
    puts "Speed of light is #@@speed_of_light m/s"
    puts "Time is #@time seconds"
    puts "Distance is #{@@speed_of_light * @time / 1000} km"
  end
end

p = EinsteinParticle.new(20)

p.report

# interpolated code can be one or more statements
puts "now is #{def the(a)
                 'the ' + a
               end
               the('time')
              } for all bad coders..."

puts %q/general single-quoted string/ # => general single-quoted string
puts %Q!general double-quoted string! # => general double-quoted string
puts %Q{Seconds/day: #{24*60*60}}     # => Seconds/day:86400

# Q is not needed
puts %!general double-quoted string! # => general double-quoted string
puts %{Seconds/day: #{24*60*60}}     # => Seconds/day:86400

# The character following the q or Q is the delimiter. If it is an opening bracket [,
# brace {, parenthesis (, or less-than sign <, the string is read until the matching
# close symbol is found.

puts %[This continues until a closing square brace]
puts %{This continues until a closing curly brace}
puts %(This continues until a closing parenthesis)
puts %<This continues until a closing greater than>

# Otherwise, the string is read until the next occurrence of the same delimiter (as above)

# Constructing a string using a here document:

str1 = <<END_OF_STRING
   The body of the string is the input lines up to one starting with the same text that
   followed the '<<'. Ruby does not strip whitespace from these strings.
END_OF_STRING

puts str1

# If you put a minus sign after the << characters, you can indent the terminator:
str2 = <<-END_OF_STRING
 The body of the string is the input lines up to one starting with the same text 
 that followed the '<<'
          END_OF_STRING

puts str2

# Multiple here docs on a single line. Each acts as a separate string. The bodies
# of the here documents are fetched sequentially from the source lines that follow:

print <<-STRING1, <<-STRING2
 Concat
 STRING1
       enate. It does look like
        the end marker needs to
         be on a line by itself,
          with or without leading
           whitespace 
       STRING2
