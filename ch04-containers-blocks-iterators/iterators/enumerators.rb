a = [ 1, 3, "cat" ]
h = { dog: "canine", fox: "vulpine" }

# Create Enumerators
enum_a = a.to_enum
enum_h = h.enum_for

p enum_a.next # => 1
p enum_h.next # => [:dog, "canine"]
p enum_a.next # => 3
p enum_h.next # => [:fox, "vulpine"]

enum_a = a.each # create an Enumerator using an internal iterator
p enum_a.next # => 1
p enum_a.next # => 3

short_enum = [1, 2, 3].to_enum
long_enum = ('a'..'z').to_enum

loop do
  puts "#{short_enum.next} - #{long_enum.next}"
end
