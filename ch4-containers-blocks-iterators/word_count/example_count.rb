require_relative "words_from_string.rb"
require_relative "count_frequency.rb"

raw_text = %{The problem breaks down into two parts. First, given some text
as a string, return a list of words. That sounds like an array. Then, build
a count for each distinct word. That sounds like a use for a hash---we can
index it with the word and use the corresponding entry to keep a count.}

word_list = words_from_string(raw_text)

counts = count_frequency(word_list)

puts "counts > #{counts}"

sorted = counts.sort_by {|word, count| count}

puts "sorted > #{sorted}"

top_five = sorted.last(5)

puts "Top five #{top_five}"
p top_five

puts "Top five: ugly..."

for i in 0...5 # this is ugly code - read on for a better version
  word_ = top_five[i][0]
  count_ = top_five[i][1]
  puts "#{word_}: #{count_}"
end

puts "Top five: each..."

top_five.each do |word, count|
  puts "#{word}: #{count}"
end

puts "Top five: map..."

x = top_five.map { |word, count| "#{word}: #{count}" }

p x
puts x
