class CreateStep < ActiveRecord::Migration
  def change
    create_table :steps do |t|
    	t.string :step_description 
    end
  end
end
