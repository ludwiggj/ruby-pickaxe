proc1 = -> arg { puts "In proc1 with #{arg}" }

proc2 = -> arg1, arg2 { puts "In proc2 with #{arg1} and #{arg2}" }

proc3 = -> (arg1, arg2) { puts "In proc3 with #{arg1} and #{arg2}" }

proc1.call "ant"        # => In proc1 with ant

proc2.call "bee", "cat" # => In proc2 with bee and cat

proc3.call "dog", "elk" # => In proc3 with dog and elk

# Terse syntax also in favour when passing multiple procs
def my_if(condition, then_clause, else_clause)
  if condition
    then_clause.call
  else
    else_clause.call
  end
end

5.times do |val|
  my_if val < 2,
    -> { puts "#{val} is small" },
    -> { puts "#{val} is big" }
end

# A trivial example of reimplementing a while loop using a method.
# The block condition is evaluated each time around the loop:
def my_while(cond, &body)
  while cond.call
    body.call
  end
end

a = 0

my_while -> { a < 3 } do
  puts a
  a += 1
end

# This is an error: wrong number of arguments (2 for 1) (ArgumentError)

# my_while -> { a < 3 }, -> { puts a; a += 1 }

# This is a syntax error

# def my_while(&cond, &body)
#  while cond.call
#    body.call
#  end
# end

def another_while(cond, body)
  while cond.call
    body.call
  end
end

a = 0

another_while -> { a < 3 }, -> { puts a; a += 1 }
