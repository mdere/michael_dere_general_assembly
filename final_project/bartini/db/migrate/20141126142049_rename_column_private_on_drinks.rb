class RenameColumnPrivateOnDrinks < ActiveRecord::Migration
  def change
    rename_column :drinks, :private, :visibility
  end
end
