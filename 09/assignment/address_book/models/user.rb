require 'active_record'
require_relative 'address_entry'

### Separate address books for each user?  Nice!
class User < ActiveRecord::Base
	has_many :address_entries


	def self.display_user_welcome
		puts "###############################"
		puts "##Welcome to Address Book 2.0##"
		puts "###############################"
		puts "Brought to you by Michael Dere"
		puts "" 
	end

	# TODO - add logic to make user create new user if no user exists.

	def self.start_login
    ### Note: This might run slightly faster:
    ###
    ###         !User.any?
    ###
		if !User.all.present?
			puts "No Active Users, please create a user to begin..."
			User.create_user
	  elsif AddressEntry.confirmation_return("Do you want to create a new User? (y/n): ")
			User.create_user

      ### Thought: It seems like the 'creating_another'
      ###          variable is unnecessary.  Won't it
      ###          always be the same as the return
      ###          value of AddressEntry.confirmation_return ?
      ###          Likewise, you can probably eliminate
      ###          the conditional inside the while statement.
			creating_another = true		
			while creating_another
				if AddressEntry.confirmation_return("Do you want to create another User? (y/n): ")
					User.create_user
				else
					creating_another = false
				end
			end			
		end
		User.display_users
		puts "To start, enter your user name displayed above."
		print "Input User Name: "
		user_name = $stdin.gets.chomp
		checking = User.confirm_user_name(user_name)
		while checking
			puts "Please Enter correct User Name"
			user_name = $stdin.gets.chomp
			checking = User.confirm_user_name(user_name)
		end
		User.where("user_name like ?", "%#{user_name}%").last.id
	end

  ### Thoughts:
  ###   1. The return value of this method is
  ###      the opposite of what you'd expect.
  ###      Consider renaming?
  ###
  ###   2. Alternatively: why don't you just
  ###      return the User instance when it
  ###      exists?  This would reduce the number
  ###      of DB calls that you need to make.
  ###      Example:
  ###
  ###        User.where("user_name = ?", user_name).first
  ###
	def self.confirm_user_name(user_name)
		user = User.where("user_name = ?", user_name)
		if user.any?
			return false
		else
			return true
		end
	end

	def self.create_user
		puts "Creating User..."
		print "Input First Name: "
		first_name = $stdin.gets.chomp
		print "Input Last Name: "
		last_name = $stdin.gets.chomp
		print "Input User Name: "
		user_name = $stdin.gets.chomp
		begin
			puts "Thank you, creating User [#{user_name}] for #{first_name} #{last_name}..."
			User.create(first_name: first_name, last_name: last_name, user_name: user_name)
			puts "User Created..."
		rescue => e
			puts "Could not create user due to the following reason: #{e.message}"
		end
	end

	def self.display_users
		users = User.all
		users.each do |u|
			puts "================================="
			puts "User ID: #{u.id} - #{u.user_name}"
			puts "================================="
		end
	end

end