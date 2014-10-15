# Michael Dere
# Updated since 10/14/2014

# Requirements:
# 1. Program must tell the user that it is thinking of a number between 1 and 10. 
# 2. User given 5 chances.
# 3. If guess is too low, then print “Too low!”
# 4. guess too high, then print “Too high!”
# 5. Correct → “NAILED IT!!!”.
# 6. Program tells you the number then Exits immediately. 
# 7. After 5 guesses you lose "You lose! I win! Womp womp!"

# Stretch Goals
# 1. Allow user specify number of guesses
# 2. min or max number
# 3. Give rescue/begin case
# 4. Ask user to play again. → yes “Horray!” or no “Aw, shucks…”

# Setting Up Game
main_loop_running = true

while main_loop_running
	waiting = true
	total_guesses = 5
	while waiting
	  puts "Do you want override total guesses in this game? (Y/N)"
	  prompt = $stdin.gets.chomp.downcase
	  if prompt == "y" || prompt == "yes"
			puts "How many guesses do you want?"
			total_guesses = $stdin.gets.chomp
			checking = true
			regex_check = /^[0-9]+$/
			while checking
			  if !regex_check.match(total_guesses).nil? && !(total_guesses == "0")
			    checking = false
			  elsif total_guesses == "0"
			  	puts "Sheesh buddy, give yourself a chance!"
			  	total_guesses = $stdin.gets.chomp
			  else
			  	puts "You inputted #{total_guesses}, please input a valid number. Sheesh"
			  	total_guesses = $stdin.gets.chomp
				end
			end
			puts "You chose #{total_guesses} guesses!"
			waiting = false
	  elsif prompt == "n" || prompt == "no"
			total_guesses = 5
			puts "defaulted guesses is #{total_guesses}"
			waiting = false
	  else 
			puts "Incorrect input"
	  end
	end

	waiting = true
	min = 0
	lower_overrided = true
	while waiting
	  puts "Do you want override lower threshold in this game?"
	  prompt = $stdin.gets.chomp.downcase
	  if prompt == "y" || prompt == "yes"
			puts "Lower threshold?"
			min = $stdin.gets.chomp
			checking = true
			regex_check = /^[0-9]+$/
			while checking
			  if !regex_check.match(min).nil?
			    checking = false
			  else
			  	puts "You inputted #{min}, please input a valid number. Sheesh"
			  	min = $stdin.gets.chomp
				end
			end			
			puts "You set lower threshold to be #{min}"
			waiting = false
	  elsif prompt == "n" || prompt == "no"
			min = 0
			puts "defaulted lower threshold is #{min}"
			waiting = false
			lower_overrided = false
	  else 
			puts "Incorrect input"
	  end
	end    


	max_is_set = false
	waiting = true
	max = 10
	while waiting
	  puts "Do you want override upper threshold in this game?"
	  prompt = $stdin.gets.chomp.downcase
	  if prompt == "y" || prompt == "yes"
		while !max_is_set
		  puts "Upper threshold?"
		  max = $stdin.gets.chomp
			checking = true
			regex_check = /^[0-9]+$/
			while checking
			  if !regex_check.match(max).nil?
			    checking = false
			  else
			  	puts "You inputted #{max}, please input a valid number. Sheesh"
			  	max = $stdin.gets.chomp
				end
			end			  
		  if max.to_i <= min.to_i
			puts "You may not do that, choose a number higher than #{min}" 
		  else
			puts "You set upper threshold to be #{max}"
			max_is_set = true
			waiting = false
		  end
		end
	  elsif (prompt == "n" || prompt == "no") && !lower_overrided
		max = 10
		puts "defaulted upper threshold is #{max}"
		waiting = false
	  else
		puts "Incorrect input or you need to override upper threshold"    
	  end
	end

	# Generate Random Number
	random_number = rand(max.to_i)

	# Playing the game now, guess number
	guessed = false
	total_guesses = total_guesses.to_i	
	while !guessed
	  puts "Guess the Magic Number!"
	  prompt = $stdin.gets.chomp
		checking = true
		regex_check = /^[0-9]+$/
		while checking
			if !regex_check.match(prompt).nil?
				checking = false
			else
				puts "You inputted #{prompt}, please input a valid number. Sheesh"
				prompt = $stdin.gets.chomp
			end
		end				  
		if total_guesses == 0
			puts "You lose! I win! Womp womp!"  
			guessed = true
	  else	  
	  	prompt = prompt.to_i
			if prompt == random_number && total_guesses > 1
				puts "NAILED IT!!! The number was #{random_number}!"
				guessed = true
			elsif prompt > random_number && total_guesses > 1
				puts "Too high!"
				total_guesses = total_guesses - 1
				puts "Total guesses left is now at #{total_guesses}"
			elsif prompt < random_number && total_guesses > 1
				puts "Too low!"
				total_guesses = total_guesses - 1
				if total_guesses == 1
					puts "Last chance Buddy..."
				else
					puts "Total guesses left is now at #{total_guesses}"
				end
			end
		end
	end
	
	# Ask player if s/he wants to play again!
	waiting = true
	while waiting
	  puts "Do you want to play again!?"
	  prompt = $stdin.gets.chomp.downcase
	  if prompt == "y" || prompt == "yes"
	  	puts "Horray!"
	  	waiting = false
	  elsif prompt == "n" || prompt == "no"
	  	puts "Aw, shucks..."
	  	waiting = false
	  	main_loop_running = false
	  else
	    put "Incorrect input"
	  end
	end
end