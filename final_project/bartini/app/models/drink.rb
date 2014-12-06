class Drink < ActiveRecord::Base 
  has_many :drink_associations
  has_many :ingredients, :through => :drink_associations

	def create_drink(user_id, drink_name)
    #Drink.create
	end

	def set_drink_visibility_true(drink_id, user_id)

	end

  def set_drink_visibility_false(drink_id, user_id)

  end

end