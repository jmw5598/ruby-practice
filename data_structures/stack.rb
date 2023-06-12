require_relative "node"

module DataStructures
  class Stack
    attr_reader :count

    def initialize
      @head = nil
      @count = 0
    end

    def push(value)
      if @head == nil
        @head = Node.new(value)
      else
        new_head = Node.new(value)
        new_head.next = @head
        @head = new_head
      end
      @count += 1
    end

    def pop
      pop_value = @head
      @head = pop_value.next
      pop_value.data
      @count -= 1
    end
    
    def peek
      @head == nil ? nil : @head.data
    end
  end
end
