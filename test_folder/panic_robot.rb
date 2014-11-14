require 'map'
require 'shovel'
require 'robot'

robot = Robot.new()
robot.x = 3
robot.y = 4

shovel = Shovel.new
shovel.x = 5
shovel.y = 6

map = Map.new
map.x = 10
map.y = 4

robot.state_coordinates                # prints: I AM AT [3, 4]
robot.navigate_to(shovel.x, shovel.y)  # prints: RIGHT RIGHT UP UP
robot.state_coordinates                # prints: I AM AT [5, 6]

shovel.dig                             # prints: SCOOP