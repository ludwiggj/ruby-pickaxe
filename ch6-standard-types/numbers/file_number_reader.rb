some_file = File.open("numbers_file.txt", "r")
some_file.each do |line|
  v1,v2 = line.split # split line on spaces
  puts Integer(v1) + Integer(v2)
end
some_file.close
