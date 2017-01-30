sum = 0
mutex = Mutex.new
threads = 10.times.map do
  Thread.new do
    100_000.times do
      mutex.lock            # one at a time please
      new_value = sum + 1
      # This print causes another thread to be scheduled (because we’re waiting for the I/O to complete).
      print "#{new_value} " if new_value % 250_000 == 0
      sum = new_value
      mutex.unlock
    end
  end
end

threads.each(&:join)
puts "\nsum = #{sum}"
