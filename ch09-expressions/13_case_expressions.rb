=begin

case
when song.name == "Misty"
  puts "Not again!"
when song.duration > 120
  puts "Too long!"
when Time.now.hour > 21
  puts "It's too late"
else
  song.play
end

# More common form

case command
when "debug"
  dump_debug_info
  dump_symbols
when /p\s+(\w+)/
  dump_variable($1)
when "quit", "exit"
  exit
else
  print "Illegal command: #{command}"
end

=end

year = 1905

kind = case year
       when 1850..1889 then "Blues"
       when 1890..1909 then "Ragtime"
       when 1910..1929 then "New Orleans Jazz"
       when 1930..1939 then "Swing"
       else "Jazz"
       end

puts "#{year} is the age of #{kind}"

# case operates by comparing the target (the expression after the keyword case) with each of
# the comparison expressions after the when keywords. This test is done using comparison ===
# target. As long as a class defines meaningful semantics for === (and all the built-in
# classes do), objects of that class can be used in case expressions.

def display_line(line)
  case line
  when /title=(.*)/
    puts "Title is #$1"
  when /track=(.*)/
    puts "Track is #$1"
  end
end

display_line("Music title=The Air is Green") # => Title is The Air is Green
display_line("Music track=23")               # => Track is 23

# Ruby classes are instances of class Class. The === operator is defined in Class to test whether
# the argument is an instance of the receiver or one of its superclasses. So (abandoning the
# benefits of polymorphism and bringing the gods of refactoring down around your ears), you can
# test the class of objects:

class Shape
end

class Rectangle < Shape
end

class Square < Rectangle
end

class Circle < Shape
end

class Triangle < Shape
end

def display_shape(shape)
  case shape
  when Square, Rectangle
    puts "A square or rectangle"
  when Circle
    puts "A circle"
  when Triangle
    puts "A triangle"
  else
    puts "A shape of some sort"
  end
end

display_shape(Shape.new)
display_shape(Rectangle.new)
display_shape(Square.new)
display_shape(Circle.new)
display_shape(Triangle.new)
