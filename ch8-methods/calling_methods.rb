# You call a method by optionally specifying a receiver, giving the name of the method, and
# optionally passing some parameters and an optional block. Here’s a code fragment that
# shows us calling a method with a receiver, a parameter, and a block.

# During this method call, Ruby first sets self to the receiver (connection) and then
# invokes the method in that object.

# connection.download_mp3("jitterbug") {|p| show_progress(p) }

# For class and module methods, the receiver will be the class or module name.

puts File.size("testfile") # => 66
puts Math.sin(Math::PI/4)  # => 0.7071067811865475

# If you omit the receiver, it defaults to self, the current object.

class InvoiceWriter
  def initialize(order)
    @order = order
  end

  def write_on(output)
    # following methods called on current object
    # self is not changed, as there is no receiver
    write_header_on(output) 
    write_body_on(output)
    write_totals_on(output)
  end
 

  # Private methods may not be called with a receiver, so they must be methods available
  # in the current object. In the previous example, we’d probably want to make the helper 
  # methods private, because they shouldn’t be called from outside InvoiceWriter:

  private

  def write_header_on(output)
    puts "Writing header for #{@order} to #{output}"
  end
  
  def write_body_on(output)
    puts "Writing body for #{@order} to #{output}"
  end

  def write_totals_on(output)
    puts "Writing totals for #{@order} to #{output}"
  end
end

# Not allowed, as write_header_on method is private
# InvoiceWriter.new("order").write_header_on("paper")

InvoiceWriter.new("order").write_on("paper")
