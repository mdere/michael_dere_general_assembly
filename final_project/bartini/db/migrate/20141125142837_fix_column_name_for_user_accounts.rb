class FixColumnNameForUserAccounts < ActiveRecord::Migration
  def change
  	rename_column :drinks, :user_id, :user_account_id
  	rename_column :reviews, :user_id, :user_account_id
  	rename_column :user_drink_libraries, :user_id, :user_account_id
  	rename_column :venue_accounts, :user_id, :user_account_id
  end
end
