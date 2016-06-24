class BookInStock3

  # Short-cut to generate getters
  attr_reader :isbn, :price

  def to_s
    "ISBN: #{@isbn}, price: #{@price}"
  end
end


b1 = BookInStock3.new
puts "ISBN = #{b1.isbn}"
puts "Price = #{b1.price}"
puts b1
