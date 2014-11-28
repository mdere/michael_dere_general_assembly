class CreateUserDrinkLibrary < ActiveRecord::Migration
  def change
    create_table :user_drink_libraries do |t|
    	t.integer :user_id 
    	t.integer :drink_id 
    end
  end
end
