class BookInStock5
  def initialize(isbn, price)
    @isbn = isbn
    @price = Float(price)
  end

  def to_s
    "ISBN: #{@isbn}, price: #{@price}"
  end

  # Short code for accessors
  attr_accessor :isbn, :price
end

b1 = BookInStock5.new("isbn1", 3)
puts b1

b1.price = b1.price * 0.75
b1.isbn = "a new isbn code"
puts b1

puts "ISBN = #{b1.isbn}"
puts "Price = #{b1.price}"

