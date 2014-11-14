require 'active_record'
require_relative 'address_entry'

class Email < ActiveRecord::Base
	belongs_to :address_entry

	def self.add_email(new_entry)
		if AddressEntry.confirmation_return("Do you want to add a Email? (y/n) ")    
	    print "Enter Email: "
	    email = $stdin.gets.chomp
      category = Email.input_email_category("Choose email category - Personal/Work: ")
      Email.create(user_id: new_entry.user_id, address_entry_id: new_entry.id, email_address: email, category: category)
	    puts "Added Email: #{email} to Index for #{new_entry.first_name} #{new_entry.last_name}"
	    confirmation = true
	    while confirmation
	      if AddressEntry.confirmation_return("Do you want to add another? (y/n) ")
	        print "Enter Email: "
	        email = $stdin.gets.chomp
		      category = PhoneNumber.input_phone_category("Choose email category - Personal/Work: ")
		      Email.create(user_id: new_entry.user_id, address_entry_id: new_entry.id, email_address: email, category: category)	        
	        puts "Added Email: #{email} to Index for #{new_entry.first_name} #{new_entry.last_name}"
	      else
	        confirmation = false
	      end
	    end
	  end
	end

	def self.delete_all(address_entries, email_entries)
		if email_entries.present?
			email_entries.each do |entry|
				entry.destroy_all
			end
		end
		if address_entries.present?
			address_entries.each do |entry|
				entry.email.destroy_all
			end
		end
	end

	def self.input_email_category(message)
    print message
    $stdin.gets.chomp
	end	

	def self.list_emails_from_address_entry(entry)
	  list = entry.email
    if list.any?
    	puts "Emails:"
    	index = 0
    	list.each do |email|
    		puts "  [#{index}]  :  #{email.email_address}"
    		index += 1
    	end
    else
    	puts "No Emails listed..."
    end	
	end

	def self.list_emails(entry, index)
    if entry.present?
    	puts "Emails:"
    	puts "  [#{index}]  :  #{entry.email_address}"
    else
    	puts "No Emails listed..."
    end
	end
end