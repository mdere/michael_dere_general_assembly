require_relative 'entity'

class Robot < Entity
	attr_accessor :battery_level

	def x_movement(x_input, direction)
		(self.x - x_input).abs.times do
			puts direction
		end
	end

	def y_movement(y_input, direction)
		(self.y - y_input).abs.times do
			puts direction
		end
	end

	def navigate_to(x_new, y_new)
		if self.x < x_new
			x_movement(x_new, "RIGHT")
		elsif self.x > x_new
			x_movement(x_new, "LEFT")
		end
		self.x = x_new
		
		if self.y < y_new
			y_movement(y_new, "UP")
		elsif self.y < y_new
			y_movement(y_new, "DOWN")
		end
		self.y = y_new

		puts "I AM at [#{self.x}, #{self.y}]"
	end	

	def state_coordinates
		puts "X-Coord: #{self.x}"
		puts "Y-Coord: #{self.y}"
	end

end