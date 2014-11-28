class CreateUserAccount < ActiveRecord::Migration
  def change
    create_table :user_accounts do |t|
    	t.string :first_name 
    	t.string :last_name 
    	t.string :email 
    	t.string :user_name 
    end
  end
end
