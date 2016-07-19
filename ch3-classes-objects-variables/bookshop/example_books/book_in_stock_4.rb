class BookInStock4
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

  # Short code for setters
  attr_writer :isbn, :price
end

b1 = BookInStock4.new("isbn1", 3)
puts b1

b1.price = b1.price * 0.75
b1.isbn = "a new isbn code"
puts b1
