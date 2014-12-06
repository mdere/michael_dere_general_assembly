class DrinkAssociation < ActiveRecord::Base
  belongs_to :drink
  belongs_to :ingredient
  belongs_to :step
  
end
