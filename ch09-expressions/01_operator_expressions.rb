a, b, c = 1, 2, 3
puts a * b + c     # => 5
puts (a.*(b)).+(c) # => 5

# Classes you write can participate in operator expressions just as if they were built-in
# objects. For example, the left shift operator, <<, is often used to mean append to
# receiver. Arrays support this:

a = [ 1, 2, 3 ]
a << 4
p a          # => [1, 2, 3, 4]

class ScoreKeeper
  def initialize
    @total_score = @count = 0
  end

  def <<(score)
    @total_score += score
    @count += 1
    self
  end
  
  def average
    fail "No scores" if @count.zero?
    Float(@total_score) / @count
  end
end

scores = ScoreKeeper.new
scores << 10 << 20 << 40
puts "Average = #{scores.average}" # => Average = 23.333333333333332

class SomeClass
  def [](*params)
    puts "Indexed with #{params.join(', ')}"
  end

  def []=(*params)
    value = params.pop
    puts "Indexed with #{params.join(', ')}"
    puts "value = #{value.inspect}"
  end
end

s = SomeClass.new

s[1, 2, 3]                     # Indexed with 1, 2, 3

s[1] = 2                       # Indexed with 1, value = 2
s['cat', 'dog'] = 'enemies'    # Indexed with cat, dog, value = "enemies"
