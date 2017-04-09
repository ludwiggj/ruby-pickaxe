def processFile(f)
  puts f.external_encoding.name
  line = f.gets
  puts line.encoding
  puts line
end

f = File.open("iso-8859-1.txt")
processFile(f)

f = File.open("iso-8859-1.txt", "r:iso-8859-1")
processFile(f)

f = File.open("iso-8859-1.txt", "r:iso-8859-1:utf-8")
processFile(f)
