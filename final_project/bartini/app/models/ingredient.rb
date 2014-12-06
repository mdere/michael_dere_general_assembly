class Ingredient < ActiveRecord::Base
  belongs_to :weight_type
  has_many :drink_associations
  has_many :drinks, :through => :drink_associations

end