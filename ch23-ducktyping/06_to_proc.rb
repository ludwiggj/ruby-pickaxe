# to_proc → Proc
# Used to convert an object prefixed with an ampersand in a method call.

class OneTwo
  def to_proc
    # if proc is omitted, get following error:
    # 06_to_proc.rb:16:in `<main>': can't convert OneTwo to Proc (OneTwo#to_proc gives String) (TypeError)
    proc {"one-two"} 
  end
end

def silly
  yield
end

ot = OneTwo.new

puts silly(&ot) # => "one-two"
