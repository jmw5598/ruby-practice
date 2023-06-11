
require_relative "models/user"

include Models

user = User.new("jmw559d8", "Password@123")

authenticated = user.authenticate("jmw5598", "Password@123")

puts "Auth Status: #{authenticated ? "Authenticated" : "Unauthorized"}"


users = [
  User.new("jmw5598", "Password@123"),
  User.new("johndoe", "asdkfljasldf1@@")
]

users.each { |user| puts user.authenticate("jmw5598", "Password@123") }

users.each do |user| 
  puts user.authenticate("jmw5598", "Password@123")
end