require 'socket'

# Following works if connected to Internet, without use of proxy
client = TCPSocket.open('news.bbc.co.uk', 'www')

client.send("OPTIONS /~dave/ HTTP/1.0\n\n", 0)

puts client.readlines

client.close
