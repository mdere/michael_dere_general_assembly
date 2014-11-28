class CreateDrink < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
    	t.string :drink_name 
    	t.integer :user_id 
    	t.integer :recipe_id 
    	t.boolean :private 
    end
  end
end
