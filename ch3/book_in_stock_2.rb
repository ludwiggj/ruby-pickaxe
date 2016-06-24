class BookInStock2

  # Short-cut to generate getters
  attr_reader :isbn, :price

  def initialize(isbn, price)
    @isbn = isbn
    @price = Float(price)
  end

  def to_s
    "ISBN: #{@isbn}, price: #{@price}"
  end

  # Explicit setters
  def price=(new_price)
    @price = new_price
  end

  # Setter can be named as you wish
  def code=(new_isbn)
    @isbn = new_isbn
  end
end


b1 = BookInStock2.new("isbn1", 3)
puts b1

puts "ISBN = #{b1.isbn}"
puts "Price = #{b1.price}"

b1.price = b1.price * 0.75
b1.code = "a new isbn code"
puts b1
