f = File.open("/etc/passwd")

puts "File encoding is #{f.external_encoding}" # UTF-8

line = f.gets

puts "Data encoding is #{line.encoding}"       # UTF-8

f = File.open("/etc/passwd", "r:ascii")

puts "File encoding is #{f.external_encoding}" # US-ASCII

line = f.gets

puts "Data encoding is #{line.encoding}"       # US-ASCII
