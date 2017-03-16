while line = gets
  puts line.chomp.reverse
end

# Invoke as:

# ruby -i.bak reverse.rb forward1 forward2

# You’d find that forward1 and forward2 would now have reversed lines, and that the original files
# would be available in forward1.bak and forward2.bak.

# Can then repeat to get back to original state (plus .bak files)

# ruby -i.bak reverse.rb forward1 forward2
