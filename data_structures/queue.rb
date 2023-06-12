require_relative "node"

module DataStructures
  class Queue
    attr_reader :count

    def initialize
      @head = nil
      @count = 0
    end

    def enque(value)
      new_node = Node.new(value)

      if @head == nil
        @head = new_node
        @tail = new_node
      else
        @tail.next = new_node
        @tail = new_node
      end
      @count += 1
    end

    def deque
      current_head = @head
      @head = current_head.next
      @tail = nil if @head == nil
      current_head != nil ? current_head.data : nil
      @count -= 1
    end

    def peek
      @head == nil ? nil : @head.data
    end
  end
end
