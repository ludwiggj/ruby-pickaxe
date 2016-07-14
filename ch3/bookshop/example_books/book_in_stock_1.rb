class BookInStock1
  def initialize(isbn, price)
    @isbn = isbn
    @price = Float(price)
  end

  def to_s
    "ISBN: #{@isbn}, price: #{@price}"
  end

  # Explicit accessors
  def isbn
    @isbn
  end

  def price
    @price
  end
end

b1 = BookInStock1.new("isbn1", 3)
p b1
puts b1

puts "ISBN = #{b1.isbn}"
puts "Price = #{b1.price}"

b2 = BookInStock1.new("isbn2", 3.14)
puts b2

b3 = BookInStock1.new("isbn2", "5.14")
puts b3
