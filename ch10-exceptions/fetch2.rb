require 'open-uri'

page = "podcasts"
file_name = "#{page}.html"

output = File.open(file_name, "w")

begin
  # Placed this line inside begin, so exception it raises is caught by rescue
  web_page = open("http://pragprog.com/#{page}")
  while line = web_page.gets
    output.puts line
  end
  output.close

#rescue Exception
rescue RuntimeError => boom 
  # STDERR.puts "Failed to download #{page}: #{$!}"
  STDERR.puts "Failed to download #{page}: #{boom}"
  output.close
  File.delete(file_name)
  raise
end
