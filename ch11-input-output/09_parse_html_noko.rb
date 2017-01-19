require 'open-uri'
require 'nokogiri'

# Following works if connected to Internet, without use of proxy
doc = Nokogiri::HTML(open("https://pragprog.com/"))

puts "Page title is " + doc.xpath("//title").inner_html

# Output the first paragraph in the div with an id="copyright" # (nokogiri supports both xpath and css-like selectors)
# puts doc.css('div#copyright p')
puts doc.xpath("//div[contains(@class, 'copyright')]/p")

# Output the second hyperlink in the site-links div using xpath and css
puts "\nSecond hyperlink is"
#puts doc.xpath('id("footer-links")//a[2]')
#puts doc.css('#footer-links a:nth-of-type(2)')
puts doc.xpath("//nav[contains(@id, 'footer-links')]//a")

puts "The end..."
