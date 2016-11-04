module Input

	def kind_questions
		@start, @finish = nil	
		puts "\tHello fellow mortal, write down the starting square"
		input(true)
		puts "\tNow just tell me the desired ending cell and we are done"
		input(false)
		puts "#{@start} #{@finish}"
	end

	def input(start_or_finish)
		# start is true, finish is false
		print "\t>"
		input  = gets.chomp.split("")
		error  = "\tlook, it's easy, the format is: #{"\n\tA4".center(90)}\n\twrite down something similar"
		output = []

		# puts input.join("*")
		# puts ("A".."H").to_a.include?(input[0].upcase)
		# puts ("0".."7").to_a.include?(input[1])		
		puts "#{@start} #{@finish}"
		if ("A".."H").to_a.include?(input[0].upcase)
			output << letters_to_numbers(input[0].upcase)
		else
			puts error
			input(true)
		end

		if ("0".."7").to_a.include?(input[1])	 
			output << input[1].to_i
		else
			puts error
			input(false)
		end
		start_or_finish ? @start = output : @finish = output
	end

	def letters_to_numbers(letter)
		return ("A".."H").to_a.index(letter)
	end

end

include Input
puts kind_questions
# # puts letters_to_numbers("H")