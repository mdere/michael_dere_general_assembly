class CreateRecipe < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.integer :drink_id 
    	t.integer :step_id 
    end
  end
end
