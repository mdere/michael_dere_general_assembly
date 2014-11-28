class CreateWeightType < ActiveRecord::Migration
  def change
    create_table :weight_types do |t|
    	t.string :type  #fluid/solid/etc
    	t.string :measure_type  #oz/floz/etc
    end
  end
end
