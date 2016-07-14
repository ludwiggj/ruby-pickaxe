def count_frequency_first_go(word_list)
  counts = Hash.new

  for next_word in word_list
    if counts.has_key?(next_word)
      counts[next_word] += 1
    else
      counts[next_word] = 1
    end
  end
  counts
end

def count_frequency(word_list)
  # Default value returned for missed key is 0
  counts = Hash.new(0)

  for word in word_list
    counts[word] += 1
  end

  counts
end

p count_frequency_first_go(["sparky", "the", "cat", "sat", "on", "the", "mat"])

p count_frequency(["sparky", "the", "cat", "sat", "on", "the", "mat"])
