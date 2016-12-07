class SongList
  def search(field, params)
    puts "Searching #{field} with params #{params}"
  end

  # Let’s look inside our search method. It gets passed a field name and an options hash.
  # We want to default the duration to 120 seconds, and validate that no invalid options
  # are passed. Pre Ruby 2.0, the code would look something like:
  def validated_search(field, options)
    options = { duration_less_than: 120 }.merge(options)
    
    if options.has_key?(:duration_less_than)
      duration_less_than = options[:duration_less_than]
      options.delete(:duration_less_than)
    end

    if options.has_key?(:genre)
      genre = options[:genre]
      options.delete(:genre)
    end
    
    fail "Invalid options: #{options.keys.join(', ')}" unless options.empty?

    # rest of method
    puts "Searching #{field} with genre #{genre} and duration less than #{duration_less_than}"
  end

  # Ruby 2 allows you to define keyword arguments to your methods. You still pass in the hash,
  # but Ruby now matches the hash contents to your keyword argument list. It also validates
  # that you don’t pass in any unknown arguments.

  def validated_search_2(field, genre: nil, duration_less_than: 120)
    p [field, genre, duration_less_than ]
  end

  # You can collect these extra hash arguments as a hash parameter—just prefix one element of
  # your argument list with two asterisks (a double splat).

  def validated_search_3(field, genre: nil, duration_less_than: 120, **rest)
    p [field, genre, duration_less_than, rest]
  end
end

list = SongList.new

# Second parameter is a hash literal
list.search(:titles, { genre: "jazz", duration_less_than: 270 })

# However, this approach is slightly clunky, and that set of braces could easily be mistaken
# for a block associated with the method. So, Ruby has a shortcut. You can place key => value
# pairs in an argument list, as long as they follow any normal arguments and precede any
# splat and block arguments. All these pairs will be collected into a single hash and passed as
# one argument to the method. No braces are needed.
list.search(:titles, genre: "jazz", duration_less_than: 270)

list.validated_search(:titles, genre: "jazz", duration_less_than: 270)
list.validated_search(:titles, genre: "jazz")

# Note that it doesn't mind if you don't pass the genre!
list.validated_search(:titles, duration_less_than: 15)

# Invalid arguments
# list.validated_search(:titles, genre: "rap", format: "cd", duration_less_than: 15, stars: 3, tempo: "slow")

list.validated_search_2(:titles, genre: "jazz", duration_less_than: 270)
list.validated_search_2(:titles, genre: "jazz")

# Note that it doesn't mind if you don't pass the genre!
list.validated_search_2(:titles, duration_less_than: 15)

# Invalid arguments
# list.validated_search_2(:titles, genre: "rap", format: "cd", duration_less_than: 15, stars: 3, tempo: "slow")

list.validated_search_3(:titles, genre: "rap", format: "cd", duration_less_than: 15, stars: 3, tempo: "slow")

# Call it with a hash:

options = { duration_less_than: 432, stars: 3, genre: "jazz", tempo: "slow" }

list.validated_search_3(:titles, options)
