class AddPasswordToUserAccounts < ActiveRecord::Migration
  def change
    add_column :user_accounts, :password, :string
  end
end
