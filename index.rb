require_relative "data_structures/linked_list"
require_relative "data_structures/stack"
require_relative "data_structures/queue"

include DataStructures

# Stacks
puts "\nSTACK\n"
stack = Stack.new

stack.push(5)
stack.push(12)

puts stack.peek
puts stack.pop
puts stack.peek

stack.push(1)
stack.push(111)
stack.push(21)

puts "stack count: #{stack.count}"

stack.pop
stack.pop
stack.pop

puts stack.peek
stack.pop

puts stack.peek
puts "stack count: #{stack.count}"


# Queues
puts "\nQUEUE\n"
queue = DataStructures::Queue.new

queue.enque(5)

puts queue.peek

queue.enque(12)

puts queue.peek
puts "queue count: #{queue.count}"

queue.deque

puts queue.peek

queue.deque

puts queue.peek

queue.enque(123)

puts queue.peek
puts queue.deque
puts queue.peek
puts "queue count: #{queue.count}"

# Linked List
puts "\nLINKED LIST\n"

