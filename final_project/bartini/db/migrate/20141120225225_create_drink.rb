class CreateDrink < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
    	t.string :drink_name, :null => false
    	t.integer :user_id, :null => false
    	t.integer :recipe_id, :null => false
    	t.boolean :private, :null => false
    end
  end
end
