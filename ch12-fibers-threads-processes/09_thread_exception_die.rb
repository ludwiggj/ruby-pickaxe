# However, set abort_on_exception to true or use -d to turn on the debug flag, and an unhandled
# exception kills the main thread, so the message Done never appears. (This is different from
# Ruby 1.8, where the exception killed all running threads.)

Thread.abort_on_exception = true

threads = 4.times.map do |number|
  Thread.new(number) do |i|
    raise "Boom!" if i == 1
    print "#{i}\n"
  end
end

puts "Waiting"
sleep 0.1
puts "Done"
