require 'open-uri'

page = "podcasts"
file_name = "#{page}.html"

output = File.open(file_name, "w")
web_page = open("http://pragprog.com/#{page}")
while line = web_page.gets
  output.puts line
end
output.close
