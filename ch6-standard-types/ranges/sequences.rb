
# inclusive sequence
a = 1..10
p a                 # => 1..10
p a.to_a            # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p 'a'..'z'          # => 'a'..'z'
b = 'bar'..'bat'
p b.to_a            # => ["bar", "bas", "bat"]
enum = b.to_enum
p enum.next         # => "bar"
p enum.next         # => "bas"
p enum.next         # => "bat"

# exclusive sequence
c = 0..."car".length
p c.to_a            # => [0, 1, 2]

digits = 0..9
p digits.include?(5)    # => true
p digits.max            # => 9
p digits.reject{|i|i<5} # => [5,6,7,8,9]
p digits.inject(:+)     # => 45

# iterating off the end throws an exception
p enum.next
