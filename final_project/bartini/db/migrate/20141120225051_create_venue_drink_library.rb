class CreateVenueDrinkLibrary < ActiveRecord::Migration
  def change
    create_table :venue_drink_libraries do |t|
    	t.integer :bar_id, :null => false
    	t.integer :drink_id, :null => false
    end
  end
end
