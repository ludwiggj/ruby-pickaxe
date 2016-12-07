class Person
  include Comparable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "#{@name}"
  end

  def <=>(other)
    self.name <=> other.name
  end
end

matz = Person.new("Matz")
guido = Person.new("Guido")
larry = Person.new("Larry")

# Compare using >
puts ">"
puts "#{matz.name} > #{matz.name} ? #{matz > matz}"
puts "#{matz.name} > #{guido.name} ? #{matz > guido}"
puts "#{guido.name} > #{larry.name} ? #{guido > larry}"
puts

# Compare using >=
puts ">="
puts "#{matz.name} >= #{matz.name} ? #{matz >= matz}"
puts "#{matz.name} >= #{guido.name} ? #{matz >= guido}"
puts "#{guido.name} >= #{larry.name} ? #{guido >= larry}"
puts

# Compare using <
puts "<"
puts "#{matz.name} < #{matz.name} ? #{matz < matz}"
puts "#{matz.name} < #{guido.name} ? #{matz < guido}"
puts "#{guido.name} < #{larry.name} ? #{guido < larry}"
puts

# Compare using <=
puts "<="
puts "#{matz.name} <= #{matz.name} ? #{matz <= matz}"
puts "#{matz.name} <= #{guido.name} ? #{matz <= guido}"
puts "#{guido.name} <= #{larry.name} ? #{guido <= larry}"
puts

# Compare using ==
puts "=="
puts "#{matz.name} == #{matz.name} ? #{matz == matz}"
puts "#{matz.name} == #{guido.name} ? #{matz == guido}"
puts "#{guido.name} == #{larry.name} ? #{guido == larry}"
puts

# between?
puts "between?"
puts "#{larry.name}.between?(#{guido.name}, #{matz.name}) ? #{larry.between?(guido, matz)}"
puts "#{matz.name}.between?(#{guido.name}, #{larry.name}) ? #{matz.between?(guido, larry)}"
puts "#{matz.name}.between?(#{guido.name}, #{matz.name}) ? #{matz.between?(guido, matz)}"
puts


# Sort an array of Person objects
puts "Sorted list:"
puts [ matz, guido, larry].sort
