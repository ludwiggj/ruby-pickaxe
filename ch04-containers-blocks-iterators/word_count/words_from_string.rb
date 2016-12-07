def words_from_string(string)
  # scan returns an array of substrings that match a given pattern.
  # The pattern [\w']+ matches sequences containing “word characters” and single quotes
  string.downcase.scan(/[\w']+/)
end

p words_from_string("But I didn't inhale, he said (emphatically)")
p words_from_string("'Hello', he said, I'm pleased to meet you.")
