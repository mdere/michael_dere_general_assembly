class CreateWeightType < ActiveRecord::Migration
  def change
    create_table :weight_types do |t|
    	t.string :type, :null => false #fluid/solid/etc
    	t.string :measure_type, :null => false #oz/floz/etc
    end
  end
end
