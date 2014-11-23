require 'active_record'

print "Establishing connection..."

ActiveRecord::Base.establish_connection({
  adapter:  "sqlite3",

  ### Heh.  Copy-pasta
  database: "./library.db"
})

print "Connected!"