class CreateIngredient < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
    	t.string :ingredient_name 
    	t.integer :weight_type_id 
    end
  end
end
