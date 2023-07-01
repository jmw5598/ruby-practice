require_relative "route_strategy"
require_relative "../route"

module TripRouter
  module Strategies
    class ByFootStrategy < RouteStrategy
      def calculate_route(from, to)
        TripRouter::Route.new("Directions for a by foot route...", 10 * 50)
      end
    end
  end
end
