module TripRouter
  class Route
    attr_accessor :directions, :total_time

    def initialize(directions, total_time)
      @directions = directions
      @total_time = total_time
    end
  end
end
