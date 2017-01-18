require 'date'

# Regarding use of double-colon operator, see: http://stackoverflow.com/questions/3009477/what-is-rubys-double-colon

# :: Lets you access a constant, module, or class defined inside another class or module. It is used to provide
# namespaces so that method and class names don't conflict with other classes by different authors.
# A common use of :: is to access constants defined in modules (as below).
# The :: operator does not allow you to bypass visibility of methods marked private or protected.

# Chaining
p [ 3, 1, 7, 0 ].sort.reverse  # => [7, 3, 1, 0]

class MP3
  Jazz = 0
end

class Song
  TradJazz = 0
  Jazz = 1
  Other = 2
  
  attr_reader :mp3_type, :written
  
  def initialize()
    @mp3_type = MP3::Jazz
    @written = Date.new(1935, 1, 1)
  end
end

song = Song.new

# :: below is a namespace 
puts "#{song.mp3_type} #{song.written} #{MP3::Jazz}"
song_type = if song.mp3_type == MP3::Jazz
              if song.written < Date.new(1935, 1, 1)
                puts "TradJazz"
                Song::TradJazz
              else
                puts "Jazz"
                Song::Jazz
              end
            else
              puts "Other"
              Song::Other
            end

puts song_type

class Rating
  SkipThisOne = :skip
  CouldDoBetter = :so_so
  Rave = :rave
end

votes_cast = 12

rating = case votes_cast
         when 0...10 then Rating::SkipThisOne
         when 10...50 then Rating::CouldDoBetter
         else Rating::Rave
         end

puts rating
