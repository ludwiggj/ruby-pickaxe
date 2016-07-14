# push and pop add and remove elements from the end of an array
# thus you can use the array as a stack

stack = []
p stack.push "red"
p stack.push "green"
p stack.push "blue" # => ["red", "green", "blue"]

p stack.pop # => "blue"
p stack

p stack.pop # => "green"
p stack

p stack.pop # => "red"
p stack # => []
