# Bad monkey patching...
class Fixnum
  alias old_plus +        # We can reference the original '+' as 'old_plus'
  
  def +(other)            # Redefine addition of Fixnums. This is a BAD IDEA!
    old_plus(other).succ
  end
end

puts 1 + 2     # => 4
a = 3     
puts a += 4    # => 8
puts a + a + a # => 26
