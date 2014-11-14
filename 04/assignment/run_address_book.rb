require 'address_book_class'
# Array of address books
user_name = ""
display_application_header
puts "Do you want to start a new address book?"
checking_prompt = true
while checking_prompt
	prompt= $stdin.gets.chomp.downcase	
  	if prompt == 'y' || prompt == 'yes'
  		puts "What is your name?"
  		user_name = $stdin.gets.chomp.downcase.tr(" ", "_")
  		checking_prompt = false
  	elsif prompt == 'n' || prompt == 'no'
		 if !`ls ./address_files/`.empty?
			puts "Do you want to load an existing address file? (y/n):"
			checking_prompt = true
			while checking_prompt
				prompt = $stdin.gets.chomp.downcase	
			  	if prompt == 'y' || prompt == 'yes'
			  		choosing = true
			  		while choosing
				  		puts "Here are the list of address files"
						puts ""
						list_files()
						puts ""
						puts "Please choose a file."
						file_name_index = $stdin.gets.chomp
						checking_prompt = true
						while checking_prompt
							checking_prompt = check_num_prompt(file_name_index)
							if checking_prompt
								puts "Sorry, there are no selection for #{file_name_index}"
								list_files()
								file_name_index = $stdin.gets.chomp
							end
						end
						if !`ls ./address_files/ | grep #{get_file_name(file_name_index)}`.empty? 
							file_name = get_file_name(file_name_index)
							addresses = load_user_address_book( file_name )
							user_name = get_user_name( file_name )
							puts ""
							puts "Welcome Back #{user_name.capitalize}!"
							puts ""
							choosing = false
						else
							puts "File does not exist...please select again"
						end
					end
					checking_prompt = false
			  	elsif prompt == 'n' || prompt == 'no'
			  		checking_prompt = false
			  	else
			  		puts "Please input Yes or No. Thank you."
			  	end
			end
		end 		
  		checking_prompt = false
  	else
  		puts "Please input Yes or No. Thank you."
  	end
end

# Always run until user quits (setting is_running? to false)
is_running = true
while is_running
	display_menu
	prompt = $stdin.gets.chomp
	# Checking prompt
	checking_prompt = true
	while checking_prompt
		checking_prompt = check_num_prompt(prompt)
		if checking_prompt
			display_menu
			prompt = $stdin.gets.chomp
		end
	end
	# Executing choices
	if prompt == "1"
		puts "You have selected [1] to create new entry."
		puts "Please enter the first name: "
		first_name = $stdin.gets.chomp 
		puts "Please enter the last name: "
		last_name = $stdin.gets.chomp
		puts "Please enter the phone number: "
		phone_number = $stdin.gets.chomp 
		# Creating address entry
		create_entry(first_name, last_name, phone_number, addresses)
	elsif prompt == "2"
		puts "You have selected [2] to view current entries."
		if addresses.any?
			# Checking prompt
			checking_prompt = true
			choosing_index = true
			while choosing_index
				display_entries(addresses)
				puts ""
				puts "Please select number associated to the entry you want to view"
				prompt = $stdin.gets.chomp
				while checking_prompt
					checking_prompt = check_num_prompt(prompt)
					if checking_prompt
						display_entries(addresses)
						prompt = $stdin.gets.chomp
					end
				end
				index = prompt.to_i
				# Checks prompt is within range of array
				if !addresses[index].nil?
					display_address_entry(index, addresses)
					choosing_index = false
				else
					puts "Incorrect selection, please try again"
				end
				puts "Do you want to update this selection too? (y/n)"
				waiting_for_update = true
				while waiting_for_update
					prompt = $stdin.gets.chomp.downcase	
					if prompt == 'y' || prompt == 'yes'
						update_entry(index, addresses)
						waiting_for_update = false
					elsif prompt == 'n' || prompt == 'no'
						puts "Returning to the Menu."
						waiting_for_update = false
					else
						puts "Please input Yes or No. Thank you."
					end
				end			  		
			end
			checking_prompt = false
	  	elsif prompt == 'n' || prompt == 'no'
	  		checking_prompt = false
	  	else
	  		puts "Please input Yes or No. Thank you."
	  	end
	elsif prompt == "3"
		puts "You have selected [3] to delete an entry."
		if addresses.any?
			# Checking prompt
			checking_prompt = true
			choosing_index = true
			while choosing_index
				display_entries(addresses)
				puts ""
				puts "Please select number associated to the entry you want to delete"
				prompt = $stdin.gets.chomp
				while checking_prompt
					checking_prompt = check_num_prompt(prompt)
					if checking_prompt
						display_entries(addresses)
						puts "Incorrect selection, please try again"
						prompt = $stdin.gets.chomp
					end
				end
				index = prompt.to_i
				# Checks prompt is within range of array
				if !addresses[index].nil?
					deciding = true
					puts "Are you sure? (y/n)"
					while deciding
						prompt_decision = $stdin.gets.chomp
						if prompt_decision.downcase == "y" || prompt_decision.downcase == "yes"
							delete_entries(index, addresses)
							deciding = false
						elsif prompt_decision.downcase == "n" || prompt_decision.downcase == "no"
							puts "Cancelled deletion. Going back to main menu."
							deciding = false
						else
							puts "You selected #{prompt}, unfortunately this is an invalid selection."
							puts "Try y/n/yes/no"
						end
					end	
					choosing_index = false
				else
					puts "Incorrect selection, please try again"
				end
			end
		else
			puts "Nothing to delete...Please Create New Entry."
		end
	elsif prompt == "4"
		puts "Closing Address Book Application..."
		if !user_name.empty?
			save_address_book(user_name, addresses)
		else
			puts "I noticed you did not input a user name."
			puts "Do you want to save this address?"
			prompt_decision = $stdin.gets.chomp
			if prompt_decision.downcase == "y" || prompt_decision.downcase == "yes"
				puts "Input User name please: "
				user_name = $stdin.gets.chomp
				save_address_book(user_name)
				deciding = false
				puts "See you later #{user_name}"
			elsif prompt_decision.downcase == "n" || prompt_decision.downcase == "no"
				puts "Address book deleted, closing application...GoodBye."
				puts "See you later Unknown Person"
				deciding = false
			else
				puts "You selected #{prompt}, unfortunately this is an invalid selection."
				puts "Try y/n/yes/no"
			end

		end
		is_running = false
	else
		puts "Selection available is 1 through 4, please try again."
	end
end
