# An if expression in Ruby is pretty similar to if statements in other languages:

artist = "Parker"

if artist == "Gillespie" then
  handle = "Dizzy"
elsif artist == "Parker" then
  handle = "Bird"
else
  handle = "unknown"
end

puts "artist: #{artist}, handle: #{handle}"  # => artist: Parker, handle: Bird

artist = "Gillespie"

# The then keyword is optional if you lay out your statements on multiple lines:
if artist == "Gillespie"
  handle = "Dizzy"
elsif artist == "Parker"
  handle = "Bird"
else
  handle = "unknown"
end

puts "artist: #{artist}, handle: #{handle}"  # => artist: Gillespie, handle: Dizzy

artist = "Prince"

# However, if you want to lay out your code more tightly, you must separate the boolean
# expression from the following statements with the then keyword:
if artist == "Gillespie" then handle = "Dizzy"
elsif artist == "Parker" then handle = "Bird"
else handle = "unknown"
end

puts "artist: #{artist}, handle: #{handle}"  # => artist: Prince, handle: unknown

# As we’ve said before, an if statement is an expression. It returns a value.
handle = if artist == "Gillespie"
           "Dizzy"
         elsif artist == "Parker"
           "Bird"
         else
           "unknown"
         end

puts "artist: #{artist}, handle: #{handle}"  # => artist: Prince, handle: unknown

unless handle == "Purple"
  puts "artist: #{artist}, handle: #{handle}"  # => artist: Prince, handle: unknown
end

# Finally, for the C fans out there, Ruby also supports the C-style conditional expression:
handle = artist == "Prince" ? "Purple" : "Not Purple"

puts "artist: #{artist}, handle: #{handle}"  # => artist: Prince, handle: Purple

# if and unless Modifiers
# Statement modifiers let you tack conditional statements onto the end of a normal statement:
date = "12-02-16"
mon, day, year = $1, $2, $3 if date=~/(\d\d)-(\d\d)-(\d\d)/

puts "date #{day}/#{mon}/#{year}"  

class Total
  def zero?
    true
  end
end

total = Total.new

print total unless total.zero?
