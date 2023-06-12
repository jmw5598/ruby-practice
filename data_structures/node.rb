module DataStructures
  class Node
    attr_reader :data, :prev, :next
    attr_writer :data, :prev, :next

    def initialize(data)
      @data = data
      @prev = nil
      @next = nil
    end
  end
end
