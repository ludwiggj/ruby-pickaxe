require 'net/http'

# http = Net::HTTP.new('pragprog.com', 80)
# response = http.get('/book/ruby3/programming-ruby-1-9')

# Note, this redirects to https, so need to handle differently...

uri = URI('https://pragprog.com/book/ruby3/programming-ruby-1-9')

# Following works if connected to Internet, without use of proxy
Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|
  request = Net::HTTP::Get.new uri
  response = http.request request # Net::HTTPResponse object
  if response.message == "OK"
    puts response.body.scan(/<img alt=".*?" src="(.*?)"/m).uniq[0,3]
  end
end
