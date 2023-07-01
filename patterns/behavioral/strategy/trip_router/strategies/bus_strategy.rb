require_relative "route_strategy"
require_relative "../router"

module TripRouter
  module Strategies
    class BusStrategy < RouteStrategy
      def calculate_route(from, to)
        TripRouter::Route.new("Directions for a bus route...", 10 * 2)
      end
    end
  end
end
