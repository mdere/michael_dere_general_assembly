class CreateVenueLocation < ActiveRecord::Migration
  def change
    create_table :venue_locations do |t|
    	t.integer :bar_id 
    	t.integer :address_number
    	t.string :address_street
    	t.string :city
    	t.string :state_code
    	t.string :country_code
    	t.integer :zip
    end
  end
end
