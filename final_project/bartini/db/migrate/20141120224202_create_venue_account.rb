class CreateVenueAccount < ActiveRecord::Migration
  def change
    create_table :venue_accounts do |t|
    	t.string :venue_name 
    	t.integer :servie_status_id 
    	t.integer :user_id 
    end
  end
end
