module Test
  State = {}

  def state=(value)
    State[object_id] = value
  end

  def state
    State[object_id]
  end

  def state_dump
    State
  end

end

class Client
  include Test
end

c1 = Client.new
c2 = Client.new

c1.state = 'cat'
c2.state = 'dog'

puts c1.state
puts c2.state

puts c1.state_dump
puts c2.state_dump
