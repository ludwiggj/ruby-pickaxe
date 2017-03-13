class Incorrect
  attr_reader :answer
  def initialise # <-- spelling error
    @answer = 42
  end
end

ultimate = Incorrect.new
puts ultimate.answer # => nil
