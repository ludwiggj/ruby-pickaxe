
# inclusive sequence
a = 1..10
p a                 # => 1..10
p a.to_a
p 'a'..'z'          # => 'a'..'z'
b = 'bar'..'bat'
p b.to_a
enum = b.to_enum
p enum.next
p enum.next
p enum.next

# exclusive sequence
c = 0..."car".length
p c.to_a

digits = 0..9
p digits.include?(5)    # => true
p digits.max            # => 9
p digits.reject{|i|i<5} # => [5,6,7,8,9]
p digits.inject(:+)     # => 45

# iterating off the end throws an exception
p enum.next
