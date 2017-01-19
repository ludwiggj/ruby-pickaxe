# File must exist if open in read mode
# file = File.new("testfile", "r")

file = File.new("testfile", "w")

file.close

File.open("testfile", "r") do |file|
  # ... process the file
  raise StandardError # File closed authomatically, and exception propagated
end # <- file automatically closed here
