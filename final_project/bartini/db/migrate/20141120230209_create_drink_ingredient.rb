class CreateDrinkIngredient < ActiveRecord::Migration
  def change
    create_table :drink_ingredients do |t|
    	t.integer :drink_id 
    	t.integer :ingredient_id 
    	t.integer :quantity 
    end
  end
end
