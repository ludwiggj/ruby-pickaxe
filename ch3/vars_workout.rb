person = "Tim"

puts "The object in 'person' is a #{person.class}"
puts "The object has an id of #{person.object_id}"
puts "and a value of '#{person}'"

# Shallow copy
person1 = "Tim"
person2 = person1

puts person1
puts person2

person1[0] = 'J'

puts person1
puts person2

# Deep copy
person2 = person1.dup
person1[0] = "Z"

puts "person1 is #{person1}"
puts "person2 is #{person2}"

# prevent modifications to the object
person1.freeze

# This is ok as person2 is a deep copy
person2[0] = "J"

# Now make it a shallow copy and repeat
person2 = person1
person2[0] = "J"
