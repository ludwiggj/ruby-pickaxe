# Infinite enumerator (type is Enumerator)
triangular_numbers = Enumerator.new do |yielder| # yielder.class is Enumerator::Yielder
  number = 0
  count = 1
  loop do
    number += count
    count += 1
    yielder.yield number
  end
end

5.times { print triangular_numbers.next, " " }
puts

# triangular_numbers is an Enumerator, which includes Enumerable, hence its methods are available
p triangular_numbers.first(5)

# This enumerator can generate infinite sequences. Some Enumerator methods e.g. count and select (filter)
# will try to read the whole enumeration before returning a result

# Non-greedy version of select
def infinite_selectz(enum, &block)
  Enumerator.new do |yielder|
    enum.each do |value|
      yielder.yield(value) if block.call(value)
    end
  end
end

# Note the syntax, the block is still passed outside the argument list inside the brackets
p infinite_selectz(triangular_numbers) {|val| val % 10 == 0}.first(5)

# Same code, but now the block is not passed explicitly
def infinite_select_2(enum)
  Enumerator.new do |yielder|
    enum.each do |value|
      yielder.yield(value) if yield(value)
    end
  end
end

p infinite_select_2(triangular_numbers) {|val| val % 20 == 0}.first(5)

# More convenient version: monkey patch the Enumerator class, adding filters such as infinite_select directly to it
class Enumerator
  # infinite_select returns an Enumerator, so they can be chained
  def infinite_select(&block)
    Enumerator.new do |yielder|
      self.each do |value|
        yielder.yield(value) if block.call(value)
      end
    end
  end
end

p triangular_numbers
  .infinite_select {|val| val % 10 == 0 }
  .infinite_select {|val| val.to_s =~ /3/ }
  .first(5)

# Code up predicates as free-standing procs
def is_divisible_by(divisor)
  -> n { (n % divisor).zero? }
end

p infinite_selectz(triangular_numbers, &is_divisible_by(3)).first(3)

p infinite_selectz(triangular_numbers, &is_divisible_by(5)).first(3)
