p 1.coerce(2)       # => [2, 1]
p 1.coerce(2.3)     # => [2.3, 1.0]
p (4.5).coerce(2.3) # => [2.3, 4.5]
p (4.5).coerce(2)   # => [2.0, 4.5]
