# shift removes elements from the head of an array.
# Combine shift and push, and you have a first-in first-out (FIFO) queue.

queue = []

p queue.push "red"
p queue.push "green"

# Shift removes from head of queue
p queue.shift # => "red"
p queue

p queue.shift # => "green"
p queue

# unshift adds elements to the head of an array.
# So can also combine unshift and pop to mimic FIFO queue

p queue.unshift "yellow"
p queue.unshift "orange"

p queue.pop # => "yellow"
p queue

p queue.pop # => "orange"
p queue
