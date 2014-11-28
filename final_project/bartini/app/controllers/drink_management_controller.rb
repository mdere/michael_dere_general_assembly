class DrinkManagementController < ApplicationController
  def prepare_drink
    @user = UserAccount.find(1)
  end

  def prepare_ingredients
    @ingredients = Ingredient.all
    @drink_visibility = params[:visibility]
    @drink_name = params[:drink_name]
    Drink.create(drink_name: @drink_name, visibility: @visibility)
    form_tag 
  end

  def prepare_recipe

  end
end