class Knight_Travels
	# => X and Y are INVERTED: @board[y][x]
	# => graphics
	module Board
		def build_board
			@board = 8.times.map { Array.new(8, ".") }
		end

		def show_board
			puts (0..7).to_a.join("\t")
			puts ("A".."H").to_a.join("\t")
			@board.each_with_index { |line, i| puts "#{line.join("\t")} (#{i} \n\n\n" }						# => handles the 								
	end
	# => mechanics
	module Moving
		def knight_moves(ary)				# => handles the trail and calls write_board
			kp = @knight_position
			write_board(kp,true)
			@knight_position = ary 		# => also updates @knight_position
			write_board(ary)
		end

		def moves_range(ary,option) # => creates all the possible moves (even not valid)
			case option
				when 0 then return [ary[0]+1, ary[1]-2]
				when 1 then return [ary[0]+2, ary[1]-1]
				when 2 then return [ary[0]+2, ary[1]+1]
				when 3 then return [ary[0]+1, ary[1]+2]
				when 4 then return [ary[0]-1, ary[1]+2]
				when 5 then return [ary[0]-2, ary[1]+1]
				when 6 then return [ary[0]-2, ary[1]-1]
				when 7 then return [ary[0]-1, ary[1]-2]
			end
		end

		def is_valid?(ary)
			if (ary[0] > 7) or (ary[1] > 7)
				return false 
			elsif @board[ary[1]][ary[0]] == "o"
				return false 
			else
				return true
			 				# => checks if the move is valid returning a boolean
		end
	
		def circle_run_test
			7.times do |i|
				move = moves_range(@knight_position,i)
				if is_valid?(move)
					knight_moves(move)
				end
			end 			# => just a test, it's not needed
		end 							
	end
	include Board
	include Moving

	def initialize
		@turn = 1
		build_board
		@knight_position = [3,4]
		write_board(@knight_position)		# => the first time gets kickstarted to bypass the trail
		# show_board
	end
end

horse = Knight_Travels.new
#old tests
	# horse.move(2,3,true)
	# horse.knight_moves(2,3)
	# horse.knight_moves(2,1)
	# horse.knight_moves([2,1])
	# horse.knight_moves([4,2])
	# horse.move([2,3],true)

horse.circle_run_test
horse.show_board
