# You can use for to iterate over any object that responds to the method each, such as an Array
# or a Range:

for i in ['fee', 'fi', 'fo', 'fum'] # => fee fi fo fum
  print i, " "
end

for i in 1..3                       # => 1 2 3
  print i, " "
end

for i in File.open("ordinal.txt").find_all {|line| line =~ /d$/}
  print i.chomp, " "                # => second third
end

# As long as your class defines a sensible each method, you can use a for loop to traverse its objects:
class Periods
  def each
    yield "Classical"
    yield "Jazz"
    yield "Rock"
  end
end

periods = Periods.new

for genre in periods
  print genre, " "   # => Classical Jazz Rock
end
