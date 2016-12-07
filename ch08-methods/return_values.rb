# The value of a method is the value of the last statement executed by the method

def meth_one
  "one"
end

puts meth_one # => "one"

def meth_two(arg)
  case
    when arg > 0 then "positive"
    when arg < 0 then "negative"
    else "zero"
  end
end

puts meth_two(23) # => "positive"
puts meth_two(0)  # => "zero"

# This next example uses return to exit from a loop inside the method:
def meth_three
  100.times do |num|
    square = num*num
    return num, square if square > 1000
  end
end

p meth_three # => [32, 1024]

num, square = meth_three

puts "Num: #{num}, Square: #{square}"
