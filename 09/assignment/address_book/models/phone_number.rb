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

  def self.delete_all(address_entries, email_entries)
    if email_entries.present?
      email_entries.each do |entry|
        entry.address_entry.phone_number.destroy_all
      end
    end
    if address_entries.present?
      address_entries.each do |entry|
        entry.phone_number.destroy_all
      end
    end
  end

	def self.input_phone_category(message)
    print message
    $stdin.gets.chomp
	end

	def self.list_phone_numbers(address_entry)
    list = PhoneNumber.where("address_entry_id = ?", address_entry.id)
    if list.any?
    	puts "Phone Numbers:"
    	index = 0
    	list.each do |phone|
    		puts "  [#{index}]  :  #{phone.phone_number}"
    		index += 1
    	end
    else
    	puts "No Phone Number listed..."
    end
	end
end