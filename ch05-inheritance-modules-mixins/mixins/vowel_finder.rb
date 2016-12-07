class VowelFinder
  include Enumerable

  def initialize(string)
    @string = string
  end

  def each
    @string.scan(/[aeiou]/) do |vowel|
      yield vowel
    end
  end
end

vf = VowelFinder.new("the quick brown fox jumped over the arches")
puts vf.inject(:+)

# map, include?, and find_all?

mapped = vf.map do |vowel|
  vowel.next
end

p mapped

p vf.min

p vf.max

p vf.sort
