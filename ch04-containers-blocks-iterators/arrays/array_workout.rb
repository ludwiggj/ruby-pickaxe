a = [ 3.14159, "pie", 99 ]

p a.class # => Array
p a.length # => 3
p a[0] # => 3.14159
p a[1] # => "pie"
p a[2] # => 99
p a[3] # => nil

b = Array.new
p b.class # => Array
p b.length # => 0
p b[0] = "second"
p b[1] = "array"
p b # => ["second", "array"]

# Negative array indices
a = [ 1, 3, 5, 7, 9 ]
p a[-1] # => 9
p a[-2] # => 7
p a[-99] # => nil

# Index ranges
a = [ "ant", "bat", "cat", "dog", "elk", "fly", "gnu" ]

p a[1..3] # inclusive
p a[3..3]
p a[1...3] # exclusive
p a[3...3] # exlusive operator with same index returns no elements
p a[-1..-3] # reverse order returns no elements
p a[-3..-1]

# Array assignment
a = [ 1, 3, 5, 7, 9 ] #=> [1, 3, 5, 7, 9]
p a

# Element replacement
a[1] = 'bat' #=> [1, "bat", 5, 7, 9]
p a

# Element replacement, variation
a[1, 1] = 'splat' #=> [1, "splat", 5, 7, 9]
p a

# Negative index
a[-3] = 'cat' #=> [1, "splat", "cat", 7, 9]
p a

# Replace single element with an array
a[3] = [ 9, 8 ] #=> [1, "splat", "cat", [9, 8], 9]
p a

# Missing elements replaced with nil
a[6] = 99 #=> [1, "splat", "cat", [9, 8], 9, nil, 99]
p a

# More assignment variations
a = [ 1, 3, 5, 7, 9 ] #=> [1, 3, 5, 7, 9]
p a

# Replace two elements with a single element 
a[2, 2] = 'cat' #=> [1, 3, "cat", 9]
p a

# Insert element mid-array, shifting following elements to the right
a[2, 0] = 'dog' #=> [1, 3, "dog", "cat", 9] 
p a

# Replace single element with several elements (NB: As series of elements rather than an array within an array)
a[1, 1] = [ 9, 8, 7 ] #=> [1, 9, 8, 7, "dog", "cat", 9]
p a

# Remove several elements
a[0..3] = [] #=> ["dog", "cat", 9]
p a

# Missing elements represented as nil
a[5..6] = 99, 98 #=> ["dog", "cat", 9, nil, nil, 99, 98]
p a

# First and last
array = [ 1, 2, 3, 4, 5, 6, 7 ]

p array.first(4) # => [1, 2, 3, 4]
p array.first(0) # => []

p array.last(4) # => [4, 5, 6, 7]
