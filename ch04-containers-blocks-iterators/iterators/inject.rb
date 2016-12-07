puts [1,3,5,7].inject(0) {|sum, element| sum + element} # => 16
puts [1,3,5,7].inject(1) {|product, element| product * element} # => 105

# If don't inject initial value, first two elements are assumed
puts [1,3,5,7].inject {|sum, element| sum + element} # => 16
puts [1,3,5,7].inject {|product, element| product * element} # => 105

# Can also path method name 
puts [1,3,5,7].inject(:+) # => 16
puts [1,3,5,7].inject(:*) # => 105
