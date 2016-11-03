TRY IF IT WORKS WITH MORE COMPLEX THINGS


module QuickKnight

	def sons(start_square) 						# => returns a list of the valid submoves
		8.times.map do |i| 
			move = moves_range(start_square, i)
			move if is_valid?(move)
		end.compact
	end

	def quickInit(start,finish) 		# => it's a fake initialize
		build_board  #temporary
		@start   = start
		@finish  = finish
		@enders  = sons(@finish)
		@checked = []
	end

	def has_enders?(square)  					# => checks if there are direct connection
		@enders.include?(square)
	end

	def compare(squares=sons(@start)) # => calls the final string if finds direct connections
		squares.each do |square| 
			if @checked.include?(square)
				return "all squares examined"
			else
				@checked << square
				if has_enders?(square)
					formatting_result(square) 
				else
					compare(sons(square))
				end
			end
		end
	end

	def formatting_result(square)			# => prints a nice strings with the result
		puts "#{@start.join(",")} => #{square.join(",")} => #{@finish.join(",")}"
	end

	

		# you can make this recursive
			

end
require_relative "board"
require_relative "moving"
include Board
include Moving
include QuickKnight

# quickKnight([4,4],[1,2])
quickInit([2,3],[1,2]) # => this has just one move
# puts is_valid?([4,4])
# starters = neighbors(@start)
# enders = neighbors(@finish)
# puts has_enders?([3,4])
puts compare(sons([2,3]))

#.each { |s| puts s.join(",") }