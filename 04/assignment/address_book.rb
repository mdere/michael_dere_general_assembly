require 'json'

def load_user_address_book( filename )
  JSON.parse( IO.read("./address_files/#{filename}") )
end

def get_user_name( filename )
	file = `ls ./address_files | grep #{filename}`.chomp
	user_name = file.split('-')[0].strip
end

def display_menu
	puts ""
	puts "Select the following:"
	puts "[1] Create new entry."
	puts "[2] View existing entry."
	puts "[3] Delete existing entry."
	puts "[4] Quit Application"
	puts ""
end
# checking prompt
def check_num_prompt(prompt)
	regex_check = /^[0-9]+$/
	if regex_check.match(prompt).nil?
		puts "Please choose a number"
		true
	else
		false
	end
end

def create_entry(first_name, last_name, phone_number, addresses)
	hash = {'first_name' => first_name, 
			'last_name' => last_name, 
			'phone_number' => phone_number
			}

  adding_email = true
  i = 1
  while adding_email
  	puts "Do you want to add a Email to this address?"
  	prompt = $stdin.gets.chomp.downcase	
  	if prompt == 'y' || prompt == 'yes'
  		puts "Input email address ##{i}"
  		email_prompt = $stdin.gets.chomp
  		puts ""
  		puts "Adding #{email_prompt}"
  		puts ""
  		hash["email_#{i}"] = email_prompt
  		i += 1
  	elsif prompt == 'n' || prompt == 'no'
  		adding_email = false
  	else
  		puts "Invalid, please try again."
  	end
  end
	addresses.push hash
end

def display_entries(addresses)
	addresses.sort do |a,b|
	  (b['last_name'] <=> a['last_name']).nonzero? ||
	  (a['first_name'] <=> b['first_name'])
	end
	addresses.size.times do |address_index|
		first_name = addresses[address_index]['first_name']
		last_name = addresses[address_index]['last_name']
		puts "#{address_index}  #{last_name}, #{first_name}"
	end
end

def display_address_entry(index, addresses)
	current_address = addresses[index]
	current_address.each do | key, value |
		if key == 'first_name'
			puts "First name: #{value}"
		elsif key == 'last_name'
			puts "Last name: #{value}"
		elsif key == 'phone_number'
			puts "Phone Number: #{value}"
		elsif key.include? "email"
			puts "#{key}: #{value}"
		end
	end
end

def delete_entries(entry_index, addresses)
	addresses.delete_at(entry_index)
end

# Array of address books
addresses = []
user_name = ""
puts "Do you want to start a new address book?"
checking_prompt = true
while checking_prompt
	prompt= $stdin.gets.chomp.downcase	
  	if prompt == 'y' || prompt == 'yes'
  		puts "What is your name?"
  		user_name = $stdin.gets.chomp.downcase.tr(" ", "_")
  		checking_prompt = false
  	elsif prompt == 'n' || prompt == 'no'
  		checking_prompt = false
  	else
  		puts "Please input Yes or No. Thank you."
  	end
end
if !`ls ./address_files/`.empty?
	puts "Do you want to load an existing address file? (y/n)"
	checking_prompt = true
	while checking_prompt
		prompt= $stdin.gets.chomp.downcase	
	  	if prompt == 'y' || prompt == 'yes'
	  		choosing = true
	  		while choosing
		  		puts "Here are the list of address files"
				puts ""
				puts `ls ./address_files/`
				puts ""
				puts "Please choose a file."
				file_name = $stdin.gets.chomp.downcase
				if !`ls ./address_files/ | grep #{file_name}`.empty? 
					addresses = load_user_address_book( file_name )
					user_name = get_user_name( file_name )
					puts user_name
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
			end
		else
			puts "Nothing to view...Please Create New Entry."
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
			puts "Saving Address Book..."
			puts user_name
			File.open("./address_files/#{user_name}-address_book.json","w") do |f|
		  		f.write(addresses.to_json)
			end
		end
		is_running = false
	else
		puts "Selection available is 1 through 4, please try again."
	end
end
