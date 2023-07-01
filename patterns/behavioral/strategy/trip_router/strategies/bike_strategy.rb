require_relative "route_strategy"
require_relative "../route"

module TripRouter
  module Strategies
    class BikeStrategy < RouteStrategy
      def calculate_route(from, to)
        TripRouter::Route.new("Directions for a bike route...", 10 * 10)
      end
    end
  end
end