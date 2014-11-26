class DashBoardController < ApplicationController

	def show
		@list_of_drinks = Drinks.all
	end

end