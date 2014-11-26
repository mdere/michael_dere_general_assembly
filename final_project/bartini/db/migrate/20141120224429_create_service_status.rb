class CreateServiceStatus < ActiveRecord::Migration
  def change
    create_table :service_statuses do |t|
    	t.string :status, :null => false
    	t.string :tier, :null => false
    end
  end
end
