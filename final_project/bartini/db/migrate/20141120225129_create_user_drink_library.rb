class CreateUserDrinkLibrary < ActiveRecord::Migration
  def change
    create_table :user_drink_libraries do |t|
    	t.integer :user_id, :null => false
    	t.integer :drink_id, :null => false
    end
  end
end
