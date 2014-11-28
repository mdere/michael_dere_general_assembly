class CreateServiceStatus < ActiveRecord::Migration
  def change
    create_table :service_statuses do |t|
    	t.string :status 
    	t.string :tier 
    end
  end
end
