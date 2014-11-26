class CreateStep < ActiveRecord::Migration
  def change
    create_table :steps do |t|
    	t.string :step_description, :null => false
    end
  end
end
