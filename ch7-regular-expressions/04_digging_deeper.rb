str = 'Dog and Cat'
pattern = /nd/

puts pattern =~ str # => 5
puts str =~ pattern # => 5

# Different ways of creating a regex for mm/dd

puts 'The American date format is yy/mm/dd' =~ /mm\/dd/            # => 31
puts 'The American date format is yy/mm/dd' =~ Regexp.new('mm/dd') # => 31
puts 'The American date format is yy/mm/dd' =~ %r{mm/dd}           # => 31
