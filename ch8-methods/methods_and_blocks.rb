# Normally, you call the block from within the method using yield:

def double(p1)
  puts yield(p1*2)
end

double(3) {|val| "I got #{val}" }          # => "I got 6"
double("tom") {|val| "Then I got #{val}" } # => "Then I got tomtom"

# However, if the last parameter in a method definition is prefixed with an ampersand, any
# associated block is converted to a Proc object, and that object is assigned to the
# parameter. This allows you to store the block for use later.

class TaxCalculator
  def initialize(name, &block)
    @name, @block = name, block
  end

  def get_tax(amount)
    "#@name on #{amount} = #{ @block.call(amount) }"
  end
end

tc = TaxCalculator.new("Sales tax") {|amt| amt * 0.075 }

puts tc.get_tax(100) # => "Sales tax on 100 = 7.5"
puts tc.get_tax(250) # => "Sales tax on 250 = 18.75"
