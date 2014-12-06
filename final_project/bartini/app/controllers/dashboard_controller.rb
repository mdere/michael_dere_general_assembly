class DashboardController < ApplicationController

	def index
		@list_of_drinks = Drink.all
	end

  def datafile(drink_id)
    DataStorage.find_by(drink_id: drink_id)
  end



end