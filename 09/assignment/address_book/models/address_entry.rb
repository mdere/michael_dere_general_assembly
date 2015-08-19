require 'active_record'
require_relative 'email'
require_relative 'phone_number'

class AddressEntry < ActiveRecord::Base
  ### FIXME: Should be plural  (phone_numbers)
  has_many :phone_number

  ### FIXME: Should be plural  (emails)
  has_many :email

  belongs_to :user
  def self.display_address_menu
    puts "==============================="
    puts "[1] Create Entry"
    puts "[2] Search Entries"
    puts "[3] Delete Entries"
    puts "[4] Quit"
    print "Please Select the selections displayed above: "
  end

  def self.create_entry(user_id)
  	print "Enter First Name: "
  	first_name = $stdin.gets.chomp
  	print "Enter Last Name: "
  	last_name = $stdin.gets.chomp
    AddressEntry.create(user_id: user_id, first_name: first_name, last_name: last_name)
    puts "Added #{first_name} #{last_name} to the address book."
  	new_entry = AddressEntry.where("user_id = ?", user_id).last
    # Adding Phone
    PhoneNumber.add_phone_number(new_entry)
    # Adding Email
    Email.add_email(new_entry)
  end

  def self.search_entry(user_id)
    puts "What would you like to search by?"
    puts "[1] Last Name"
    puts "[2] First Name"
    puts "[3] Email Address"
    puts ""
    prompt = AddressEntry.num_confirmation_check($stdin.gets.chomp).to_i
    if prompt == 1
      puts "Selected to search by Last Name!"
      AddressEntry.get_by_last_name(user_id, 0)
    elsif prompt == 2
      puts "Selected to search by First Name!"
      AddressEntry.get_by_first_name(user_id, 0)
    elsif prompt == 3
      puts "Selected to search by Email Address!"
      AddressEntry.get_by_email_address(user_id, 0)
    else
      puts "Please enter the valid selection displayed above."
    end
  end

  def self.delete_entry(user_id)
    puts "What would you like to search by for deletion?"
    puts "[1] Last Name"
    puts "[2] First Name"
    puts "[3] Email Address"
    puts ""
    prompt = AddressEntry.num_confirmation_check($stdin.gets.chomp).to_i
    if prompt == 1
      puts "Selected to search by Last Name!"
      list_of_addresses = AddressEntry.get_by_last_name(user_id, 1)
      puts ""
      if list_of_addresses.present?
        if AddressEntry.confirmation_return("Do you want to delete all these entries? (y/n): ")
          AddressEntry.delete_all(list_of_addresses)
        else
          print "Pick Address Index to delete: "
          prompt = AddressEntry.num_confirmation_check($stdin.gets.chomp).to_i
          AddressEntry.check_prompt_deletion(prompt)
          AddressEntry.delete_selection(user_id, prompt, list_of_addresses)
        end
      else
        puts "Nothing to Delete..."
      end
    elsif prompt == 2
      puts "Selected to search by First Name!"
      list_of_addresses = AddressEntry.get_by_first_name(user_id, 1)
      if list_of_addresses.present?       
        if AddressEntry.confirmation_return("Do you want to delete all these entries? (y/n): ")
          AddressEntry.delete_all(list_of_addresses)
        else
          print "Pick Address Index to delete: "
          prompt = AddressEntry.num_confirmation_check($stdin.gets.chomp).to_i
          AddressEntry.check_prompt_deletion(prompt)
          AddressEntry.delete_selection(user_id, prompt, list_of_addresses)
        end
      else
        puts "Nothing to Delete..."
      end
    elsif prompt == 3
      puts "Selected to search by Email Address!"
      list_of_addresses = AddressEntry.get_by_email_address(user_id, 1)
      if list_of_addresses.present?
        if AddressEntry.confirmation_return("Do you want to delete all these entries? (y/n): ")
          AddressEntry.delete_all(list_of_addresses)
        else
          print "Pick Address Index to delete: "
          prompt = AddressEntry.num_confirmation_check($stdin.gets.chomp).to_i
          AddressEntry.check_prompt_deletion(prompt)
          AddressEntry.delete_selection(user_id, prompt, list_of_addresses)
      end
      else
        puts "Nothing to Delete..."
      end
    else
      puts "Please enter the valid selection displayed above."
    end  
  end

  def self.delete_all(address_entry)
    begin
      count = address_entry.count
      Email.delete_all(address_entry)
      PhoneNumber.delete_all(address_entry)       
      address_entry.destroy_all
      puts "Deleted #{count} Address Entries..."      
    rescue => e
      puts "Can not delete this Address Entry..."
      puts "Following error message for investigation: #{e.message}"
    end
  end

  def self.check_prompt_deletion(prompt)
    checking = true
    while checking
      if AddressEntry.where("id = ?", prompt).present?
        checking = false
      else
        puts "Address Index #{prompt} does not exist..."
        print "Enter Valid Address Index: "
        prompt = AddressEntry.num_confirmation_check($stdin.gets.chomp).to_i
      end
    end
  end

  def self.delete_selection(user_id, prompt, list_of_addresses)
    selected_address_index = AddressEntry.find(prompt)
    if AddressEntry.confirmation_return("Are you sure you want to delete selection [#{selected_address_index.id}]? (y/n) ") 
      selected_address_index.destroy
      Email.where("address_entry_index = ?", selected_address_index.id).destroy_all
      Phone.where("address_entry_index = ?", selected_address_index.id).destroy_all
      puts "Deleted Address Index #{selected_address_index.id}"
    else
      puts "Did not delete selection, returning to menu."
    end
  end

  def list_full_name
    puts "First name:  #{first_name}"
    puts "Last name: #{last_name}"  
  end

  def self.get_by_last_name(user_id, delete)
    puts "Searching entries by Last Name"
    print "Enter Search string: "
    last_name_search = $stdin.gets.chomp
    list_by_last_name = AddressEntry.where("user_id = ? and last_name like ?", user_id, "%#{last_name_search.downcase}%").order(:last_name)
    puts ""
    puts "Found #{list_by_last_name.count} matches!"
    puts ""
    list_by_last_name.each do |entry|
      puts "-- Address Index [#{entry.id}] --"
      entry.list_full_name
      PhoneNumber.list_phone_numbers(entry)
      Email.list_emails_from_address_entry(entry)
      puts "==============================="
    end
    # returns list_by_last_name for deletion purposes only.
    if delete == 1
      return list_by_last_name
    end
  end

  def self.get_by_first_name(user_id, delete)
    puts "Searching entries by First Name"
    print "Enter Search string: "
    first_name_search = $stdin.gets.chomp
    list_by_first_name = AddressEntry.where("user_id = ? and first_name like ?", user_id, "%#{first_name_search.downcase}%").order(:first_name)
    puts ""
    puts "Found #{list_by_first_name.count} matches!"
    puts ""
    list_by_first_name.each do |entry|
      puts "-- Address Index [#{entry.id}] --"      
      entry.list_full_name
      PhoneNumber.list_phone_numbers(entry)
      Email.list_emails_from_address_entry(entry)
      puts "==============================="
    end
    # returns list_by_first_name for deletion purposes only.
    if delete == 1
      return list_by_first_name
    end
  end

  def self.get_by_email_address(user_id, delete)
    puts "Searching entries by Email"
    print "Enter Search string: "
    email_search = $stdin.gets.chomp
    unique_email_address_indexes = Email.where("user_id = ? and email_address like ?", user_id, "%#{email_search.downcase}%").select(:address_entry_id).distinct
    array_of_indexes = []
    unique_email_address_indexes.each do |unique|
      array_of_indexes.push unique.address_entry_id
    end
    list_by_email = AddressEntry.where("id in (?)", array_of_indexes)
    puts ""
    puts "Found #{list_by_email.count} matches!"
    puts ""
    index = 0
    if list_by_email.any?
      list_by_email.each do |entry|
        puts "-- Address Index [#{entry.id}] --"     
        entry.list_full_name
        PhoneNumber.list_phone_numbers(entry)
        Email.list_emails_from_address_entry(entry)
        index += 1
        puts "==============================="
      end
    end
    # returns list_by_email for deletion purposes only.
    if delete == 1
      return list_by_email
    end
  end


  ### Style: This method is very generic, and really
  ###        does not relate directly to models.
  ###        it should be extracted into a separate
  ###        file / library.
  def self.num_confirmation_check(prompt)
    checking = true
    regex_check = /^[0-9]+$/    
    while checking
      if !regex_check.match(prompt).nil?
        checking = false
      else
        print "Please enter a valid number: "
        prompt = $stdin.gets.chomp
      end
    end
    prompt
  end


  ### Style: This method is very generic, and really
  ###        does not relate directly to models.
  ###        it should be extracted into a separate
  ###        file / library.
  def self.confirmation_check(prompt)
  	regex = /y|yes|n|no/
  	checking_prompt = true
  	while checking_prompt  	
	  	if !regex.match(prompt.downcase).nil?
	  		puts "Proceeding..."
        checking_prompt = false
	  	else
        print "Incorrect input, please select (y/n): "
        prompt = $stdin.gets.chomp
	  	end 
    end
    prompt
  end

  ### Style: This method is very generic, and really
  ###        does not relate directly to models.
  ###        it should be extracted into a separate
  ###        file / library.
  def self.confirmation_return(message)
    print message
    prompt = AddressEntry.confirmation_check($stdin.gets.chomp)
    checking = true
    while checking
    	yes_regex = /y|yes/
    	no_regex = /n|no/
    	if !yes_regex.match(prompt).nil?
        checking = false
        return true
    	elsif !no_regex.match(prompt).nil?
        checking = false
        return false
    	end
    end
  end

end
