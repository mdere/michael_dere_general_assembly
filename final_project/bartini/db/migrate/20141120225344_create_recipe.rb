class CreateRecipe < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.integer :drink_id, :null => false
    	t.integer :step_id, :null => false
    end
  end
end
