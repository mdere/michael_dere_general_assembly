class Step < ActiveRecord::Base
  has_many :drink_associations
  has_many :ingredients, :through => :drink_associations
end