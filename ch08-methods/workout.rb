# Query methods
puts 1.even?                # => false
puts 2.even?                # => true
puts 1.instance_of?(Fixnum) # => true

a = "a carrot"

# Method and bang form
puts "#{a.chop}"            # => a carro
puts a                      # => a carrot
puts "#{a.chop!}"           # => a carro
puts a                      # => a carro

# Assignment form
def cut=(veg)
  puts "#{veg.chop}"
end

self.cut = "broccoli"
