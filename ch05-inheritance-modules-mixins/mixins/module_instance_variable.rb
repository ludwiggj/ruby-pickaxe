module InstanceVariable

  def name=(name)
    @name = name
  end

  def name
    @name
  end
end

class Client
  include InstanceVariable
end

c1 = Client.new
c2 = Client.new

puts "c1.name #{c1.name}"
puts "c2.name #{c2.name}"

c1.name = 'cat'

puts "c1.name #{c1.name}"
puts "c2.name #{c2.name}"

c2.name = 'dog'

puts "c1.name #{c1.name}"
puts "c2.name #{c2.name}"
