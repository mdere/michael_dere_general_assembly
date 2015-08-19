require_relative 'models'
require_relative 'connect'
require 'pry'

### Oops: Debug code.
binding.pry

# Choosing Username / Creating Username
address_home = true
while address_home
	user_id = User.start_login
	# Running Address Application for user above.
	running = true
	while running
		deciding = true	
		AddressEntry.display_address_menu
		prompt = AddressEntry.num_confirmation_check($stdin.gets.chomp).to_i
		while deciding 
			case prompt
			when 1
				puts "Selected [1] Create Entry..."
				AddressEntry.create_entry(user_id)
				deciding = false
			when 2
				puts "Selected [2] Search for Entry..."
				AddressEntry.search_entry(user_id)
				deciding = false
			when 3
				puts "Selected [3] Delete Entry..."
				AddressEntry.delete_entry(user_id)
				deciding = false
			when 4
				puts "Selected [4] Quitting Application..."
				puts "Don't worry -- your #{AddressEntry.where("user_id = ?", user_id).count} address book entries are safely stored in the database!"
				puts "Bye bye !"
				deciding = false
				running = false
			else
				puts "Please Select only the selection displayed above, please."
				print "Select [1-4]: "
				prompt = AddressEntry.num_confirmation_check($stdin.gets.chomp).to_i	
			end
		end
	end
	if AddressEntry.confirmation_return("Do you want log off? (y/n): ")
		address_home = false
		puts "Thank you for using Address Book 2.0"
	end
end