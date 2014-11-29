class AddPasswordToUserAccounts < ActiveRecord::Migration
  def change
    add_column :user_accounts, :password_hash, :string
    add_column :user_accounts, :password_salt, :string
  end
end
