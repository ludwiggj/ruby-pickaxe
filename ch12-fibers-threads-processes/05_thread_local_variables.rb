threads = []
i = 0
10.times do
  # pretend to prepare a 'work order', which ends up in local
  # var i
  i += 1
  # now do some stuff with 'i' in the thread
  threads << Thread.new do
    sleep 1 # pretend this is a time consuming computation
    # now we do something else with our work order...
    print "#{i}\n"
  end
end
 
threads.each {|t| t.join}

# Take 2
print "Take 2...\n"

threads = []
i = 0
10.times do
  # pretend to prepare a 'work order', which ends up in local
  # var i
  i += 1
  # now do some stuff with 'i' in the thread
  threads << Thread.new(i) do |i|
    sleep 1 # pretend this is a time consuming computation
    # now we do something else with our work order...
    print "#{i}\n"
  end
end

threads.each {|t| t.join}
