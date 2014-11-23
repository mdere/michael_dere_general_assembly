require 'active_record'
require_relative 'address_entry'

class PhoneNumber < ActiveRecord::Base
  belongs_to :address_entry

	def self.add_phone_number(new_entry)
		if AddressEntry.confirmation_return("Do you want to add a Phone Number? (y/n) ")    
      print "Enter Phone Number: "
      phone_number = $stdin.gets.chomp
      category = PhoneNumber.input_phone_category("Choose phone category - Work? Home? Mobile?: ")
      PhoneNumber.create(user_id: new_entry.user_id ,address_entry_id: new_entry.id, phone_number: phone_number, category: category)
      puts "Added Phone Number: #{phone_number} to Index for #{new_entry.first_name} #{new_entry.last_name}"
      confirmation = true
      while confirmation
        if AddressEntry.confirmation_return("Do you want to add another? (y/n) ")
        	print "Enter Phone Number: "
        	phone_number = $stdin.gets.chomp
					category = PhoneNumber.input_phone_category("Choose phone category - Work? Home? Mobile?: ")
      		PhoneNumber.create(user_id: new_entry.user_id, address_entry_id: new_entry.id, phone_number: phone_number, category: category)
         	puts "Added Phone Number: #{phone_number} to Index for #{new_entry.first_name} #{new_entry.last_name}"
      	else
        	confirmation = false
      	end
    	end
    end
	end

  ### Pro-tip: It looks like you are trying to
  ###          delete all of the phone numbers
  ###          associated w/ an entry before
  ###          deleting the entry.  Consider
  ###          marking the association as
  ###          dependent:
  ###
  ###            http://stackoverflow.com/questions/1896777/cascade-delete-in-ruby-activerecord-models
  ###            http://guides.rubyonrails.org/association_basics.html
  ###
  ###          This will cause all "dependent"
  ###          models to be deleted automatically
  ###          when the "owner" is deleted.
  def self.delete_all(address_entries)
    begin
      all_entry_phone_numbers = address_entries.phone_number
      all_entry_phone_numbers.each do |entry|
        entry.destroy
      end
    rescue => e 
      puts "Could not delete all Emails"
      puts "Following error message for investigation: #{e.message}"
    end
  end

	def self.input_phone_category(message)
    print message
    $stdin.gets.chomp
	end

	def self.list_phone_numbers(address_entry)
    ### Note: Why not just do this?
    ###
    ###         list = address_entry.phone_numbers
    ###
    list = PhoneNumber.where("address_entry_id = ?", address_entry.id)
    if list.any?
    	puts "Phone Numbers:"
    	index = 0
    	list.each do |phone|
    		puts "  [#{index}] : #{phone.category} :  #{phone.phone_number}"
    		index += 1
    	end
    else
    	puts "No Phone Number listed..."
    end
	end
end