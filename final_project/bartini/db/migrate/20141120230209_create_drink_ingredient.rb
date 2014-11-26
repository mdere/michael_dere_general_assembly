class CreateDrinkIngredient < ActiveRecord::Migration
  def change
    create_table :drink_ingredients do |t|
    	t.integer :drink_id, :null => false
    	t.integer :ingredient_id, :null => false
    	t.integer :quantity, :null => false
    end
  end
end
