module ModuleConstant
  # Module constant
  Name = []

  def name=(name)
    Name[0] = name
  end

  def name
    Name[0]
  end
end

class Client
  include ModuleConstant
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
