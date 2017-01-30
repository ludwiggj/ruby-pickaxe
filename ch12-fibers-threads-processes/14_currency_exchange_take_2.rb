rate_mutex = Mutex.new

exchange_rates = ExchangeRates.new

exchange_rates.update_from_online_feed

Thread.new do
  rate_mutex.lock
  loop do
    rate_mutex.sleep 3600
    exchange_rates.update_from_online_feed
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
