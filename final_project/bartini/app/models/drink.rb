class Drink < ActiveRecord::Base
	attr_accessor :drink_name, :user_id, :recipe_id, :private
	has_many :recipes
  has_and_belongs_to_many :ingredients

	def create_drink(user_id, drink_name,)
    #Drink.create
	end

	def set_drink_private(drink_id, user_id)

	end

end