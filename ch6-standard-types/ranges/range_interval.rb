# examples using ===, the case equality operator, effectively operates as a contains:

puts (1..10) === 5       # => true
puts (1..10) === 15      # => false
puts (1..10) === 3.14159 # => true
puts ('a'..'j') === 'c'  # => true
puts ('a'..'j') === 'z'  # => false

# This is most often used in case statements with exclusive ranges

def age(car_age) 
  case car_age
  when 0...1
    puts "Mmm.. new car smell"
  when 1...3
    puts "Nice and new"
  when 3...10
    puts "Reliable but slightly dinged"
   when 10...30
    puts "Clunker"
  else
  puts "Vintage gem"
  end
end

age(9.5)
age(10)
