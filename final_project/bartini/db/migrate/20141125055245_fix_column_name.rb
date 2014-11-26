class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :weight_types, :type, :type_of_weight
  end
end
