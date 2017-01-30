rate_mutex = Mutex.new

exchange_rates = ExchangeRates.new

exchange_rates.update_from_online_feed

Thread.new do
  loop do
    sleep 3600
    rate_mutex.synchronize do
      exchange_rates.update_from_online_feed
    end
  end
end

loop do
  print "Enter currency code and amount: "
  line = gets
  if rate_mutex.try_lock
    puts(exchange_rates.convert(line)) ensure rate_mutex.unlock
  else
    puts "Sorry, rates being updated. Try again in a minute"
  end
end
