a = b = 1 + 2 + 3
p a # => 6
p b # => 6

a = (b = 1 + 2) + 3
p a # => 6
p b # => 3

# Ruby has two basic forms of assignment. The first assigns an object reference to a variable
# or constant. This form of assignment is hardwired into the language:

instrument = "piano"
MIDDLE_A = 440

# The second form of assignment involves having an object attribute or element reference on
# the left side. These forms are special, because they are implemented by calling methods in
# the lvalues, which means you can override them.

class ProjectList
  def initialize
    @projects = []
  end

  def projects=(list)
    @projects = list.map(&:upcase) # store list of names in uppercase

    # some_objects.each(&:foo)
    #
    # Is the same as
    #
    # some_objects.each { |obj| obj.foo }
    #
    # so list.map(&:upcase) is the same as
    #
    # list.map { |obj| obj.upcase }

  end

  def [](offset)
    @projects[offset]
  end
end

list = ProjectList.new
list.projects = %w{ strip sand prime sand paint sand paint rub paint }

p list[3] # => "SAND"
p list[4] # => "PAINT"

# The value of the assignment is always the value of the parameter; the return value of the
# method is discarded. In the code that follows, result will be set to 2, even though the
# attribute setter actually returns 99.

class Test
  def val=(val)
    @val = val
    return 99
  end
end

t = Test.new

result = (t.val = 2)

p result # => 2

# +=, -=
a = 1
puts a += 2 # => 3
puts a -= 2 # => 1

# Implement on list structure
class List
  def initialize(*values)
    @list = values
  end
  
  def +(other)
    @list.push(other)
    self
  end

  def to_s
    @list.to_s
  end
end

a = List.new(1, 2)
puts a.to_s             # => [1, 2]
a += 3
puts a.to_s             # => [1, 2, 3]

# A common idiom is to use ||= to assign a value to a variable only if that variable isn’t already set:
z ||= "default value"

# This is almost, but not quite, the same as
#
# z = z || "default value"
#
# It differs in that no assignment is made at all if the variable is already set. In pseudocode, this
# might be written as
#
# var = "default value" unless var
#
# or as
#
# var || var = "default value"

# not and ! return the opposite of their operand (false if the operand is true and true if the operand
# is false). And, yes, not and ! differ only in precedence.
