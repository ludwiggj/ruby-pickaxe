def Integer.all
  Enumerator.new do |yielder, n: 0|
  loop { yielder.yield(n += 1) }
  end.lazy
end

p Integer
  .all
  .first(10)

p Integer
  .all
  .select { |i| (i % 3).zero? }
  .first(10)

def palindrome?(n)
  n = n.to_s
  n == n.reverse
end

p Integer
  .all
  .select { |i| (i % 3).zero? }
  .select { |i| palindrome?(i) }
  .first(10)

# Split up enumerators into component parts...
# as the lazy filter methods simply return new Enumerator objects
multiple_of_three =
  Integer
  .all
  .select { |i| (i % 3).zero? }

p multiple_of_three.first(10)

multiple_of_three_palindrome =
  multiple_of_three
  .select { |i| palindrome?(i) }

p multiple_of_three_palindrome.first(10)

# Code up predicates as free-standing procs
is_a_multiple_of_three = -> n { (n % 3).zero? }
p is_a_multiple_of_three.class

is_a_palindrome = -> n { n = n.to_s; n == n.reverse }

p Integer
  .all
  .select(& is_a_multiple_of_three)
  .select(& is_a_palindrome)
  .first(10)
