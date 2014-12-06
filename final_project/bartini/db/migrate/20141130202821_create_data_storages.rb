class CreateDataStorages < ActiveRecord::Migration
  def change
    create_table :data_storages do |t|
      t.string :path
      t.string :original_filename
      t.integer :user_account_id
      t.integer :drink_id

      t.timestamps
    end
  end
end
