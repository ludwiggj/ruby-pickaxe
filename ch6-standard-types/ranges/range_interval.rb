# examples using ===, the case equality operator:

puts (1..10) === 5       # => true
puts (1..10) === 15      # => false
puts (1..10) === 3.14159 # => true
puts ('a'..'j') === 'c'  # => true
puts ('a'..'j') === 'z'  # => false

# This is most often used in case statements:

car_age = 9.5

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
