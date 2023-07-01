module TripRouter
  class Router
    attr_accessor :from, :to, :strategy

    def initialize(from, to, strategy)
      @from = from
      @to = to
      @strategy = strategy
    end

    def directions
      @strategy.calculate_route(from, to)
    end
  end
end
