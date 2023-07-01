module TripRouter
  module Strategies
    class RouteStrategy
      def calculate_route(from, to)
        raise NotImplementedError.new "#{self.class} has not implemented method '#{__method__}'"
      end
    end
  end
end
