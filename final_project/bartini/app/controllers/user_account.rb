class UserAccount < ActiveRecord::Base
	has_many :drinks
	has_many :venues
end