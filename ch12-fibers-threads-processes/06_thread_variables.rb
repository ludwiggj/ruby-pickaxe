count = 0
threads = 10.times.map do |i|
  Thread.new do
    sleep(rand(0.1))
    Thread.current[:mycount] = count
    count += 1
  end
end

# Thread variables are now available from the main thread...
threads.each {|t| t.join; print t[:mycount], ", " }

puts
