require_relative "trip_router/router"
require_relative "trip_router/route"
require_relative "trip_router/location"
require_relative "trip_router/strategies/car_strategy"
require_relative "trip_router/strategies/bike_strategy"
require_relative "trip_router/strategies/bus_strategy"
require_relative "trip_router/strategies/by_foot_strategy"

def print_trip(trip)
  puts "#{trip.directions.directions} : #{trip.directions.total_time}hrs"
end

car_trip = TripRouter::Router.new(10, 10, TripRouter::Strategies::CarStrategy.new)
print_trip(car_trip)

bus_trip = TripRouter::Router.new(10, 10, TripRouter::Strategies::BusStrategy.new)
print_trip(bus_trip)

bike_trip = TripRouter::Router.new(10, 10, TripRouter::Strategies::BikeStrategy.new)
print_trip(bike_trip)

by_foot_trip = TripRouter::Router.new(10, 10, TripRouter::Strategies::ByFootStrategy.new)
print_trip(by_foot_trip)
