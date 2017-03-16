require 'rbconfig'
include RbConfig

puts CONFIG["host"]
puts CONFIG["libdir"]
