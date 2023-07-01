require_relative "route_strategy"
require_relative "../route"

module TripRouter
  module Strategies
    class CarStrategy < RouteStrategy
      def calculate_route(from, to)
        TripRouter::Route.new("Directions for a car route...", 10 * 1)
      end
    end
  end
end
