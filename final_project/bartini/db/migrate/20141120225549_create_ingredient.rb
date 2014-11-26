class CreateIngredient < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
    	t.string :ingredient_name, :null => false
    	t.integer :weight_type_id, :null => false
    end
  end
end
