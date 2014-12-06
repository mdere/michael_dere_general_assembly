class CreateDrinkAssociations < ActiveRecord::Migration
  def change
    create_table :drink_associations do |t|
      t.integer :drink_id
      t.integer :ingredient_id
      t.integer :step_id, default: 0
      t.float :quantity

      t.timestamps
    end
  end
end
