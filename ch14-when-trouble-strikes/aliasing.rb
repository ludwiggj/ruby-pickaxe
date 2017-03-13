arr = [1, 2]

hash = { arr => "value" }

puts hash[arr] # => "value"

arr[0] = 99

puts hash[arr] # => nil

hash.rehash # => {[99, 2]=>"value"}

puts hash[arr] # => "value"
