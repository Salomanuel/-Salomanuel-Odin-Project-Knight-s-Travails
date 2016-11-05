module Input

	def kind_questions
		@start, @finish = nil	
		puts "\tHello fellow mortal, write down the starting square"
		@start = get_input
		puts "\tNow just tell me the desired ending cell\n\tand we are done"
		@finish = get_input
		puts "#{@start} #{@finish}"
	end

	def get_input(mistake=false)	
		error  = "\tlook, it's easy, the format is: \n\t\tA4\n\twrite down something similar"
		output = []
		puts error if mistake
		print "\t>"
		input  = gets.chomp.upcase
		
		if input =~ /[A-H][0-7]/ 
			output << input[0].upcase
			output << input[1].to_i
			return output
		end
		self.get_input(true)
	end

	def letters_to_numbers(letter)
		return ("A".."H").to_a.index(letter)
	end

end

# include Input
# puts kind_questions
# # puts letters_to_numbers("H")