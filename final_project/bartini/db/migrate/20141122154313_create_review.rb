class CreateReview < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.integer :drink_id
    	t.integer :user_id
    	t.string :comment
    	t.integer :rating
    end
  end
end
