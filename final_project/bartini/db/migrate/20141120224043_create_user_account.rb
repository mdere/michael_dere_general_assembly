class CreateUserAccount < ActiveRecord::Migration
  def change
    create_table :user_accounts do |t|
    	t.string :first_name, :null => false
    	t.string :last_name, :null => false
    	t.string :email, :null => false
    	t.string :user_name, :null => false
    end
  end
end
