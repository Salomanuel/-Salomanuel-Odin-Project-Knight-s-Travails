module Input

	def kind_questions	
		puts "Hello fellow mortal, write down the starting square"
		@start  = input
		puts "Now just tell me the desired ending cell and we are done"
		@finish = input
	end

	def input
		print ">"
		input  = gets.chomp.split("")
		error  = "look, it's easy, the format is: \nA4\nwrite down something similar"
		output = []

		if ("A".."H").include?(input[0].upcase)
			output << letters_to_numbers(input[0].upcase)
		else
			puts error
			self.input
		end
		if (0..7).include?(input[1].to_i)
			output << input[1].to_i
		else
			puts error
			self.input
		end
		return output
	end

	def letters_to_numbers(letter)
		return ("A".."H").to_a.index(letter)
	end

end

# include Input
# puts kind_questions
# # puts letters_to_numbers("H")