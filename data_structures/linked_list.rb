require_relative "node"

module DataStructures
  class LinkedList
    attr_reader :count

    def initialize
      @head = nil
      @count = 0
    end

    def add(value)
      if @head == nil
        @head = Node.new(value)
        @tail = @head
      else
        new_tail = Node.new(value)
        @tail.next = new_tail
        @tail = new_tail
      end
      @count += 1
    end

    def remove(value)
      prev = nil
      current = @head
      until current == nil do
        if (current 
      end
    end

    def get(value)
      current = @head
      until current == nil do
        return current if current.data == value
        current = current.next
      end
      return nil
    end

  end
end
