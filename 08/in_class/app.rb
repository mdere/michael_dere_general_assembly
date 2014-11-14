require 'active_record'
require 'sqlite3'
require 'pry'

ActiveRecord::Base.establish_connection({
	adapter: 'sqlite3',
	database: 'library'
})

class Book < ActiveRecord::Base


end

binding.pry #Actives Pry