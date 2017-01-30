trap("CLD") do
  pid = Process.wait
  puts "Child pid #{pid}: terminated"
end

fork { exec(sleep 1) }
