class CreateVenueDrinkLibrary < ActiveRecord::Migration
  def change
    create_table :venue_drink_libraries do |t|
    	t.integer :bar_id 
    	t.integer :drink_id 
    end
  end
end
