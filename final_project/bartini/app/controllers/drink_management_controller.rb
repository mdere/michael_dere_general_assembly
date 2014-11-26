class DrinkManagementController < ApplicationController
  def prepare_drink
    @Drink = UserAccount.find(1)
    @ingredients = Ingredient.all
  end

  def prepare_ingredients

  end

  def prepare_recipe

  end
end