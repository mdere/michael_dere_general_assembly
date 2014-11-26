class CreateVenueAccount < ActiveRecord::Migration
  def change
    create_table :venue_accounts do |t|
    	t.string :venue_name, :null => false
    	t.integer :servie_status_id, :null => false
    	t.integer :user_id, :null => false
    end
  end
end
