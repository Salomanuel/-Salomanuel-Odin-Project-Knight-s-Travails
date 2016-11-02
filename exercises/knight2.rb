class Knight_Travels
	# => X and Y are INVERTED: @board[y][x]

	module Board 	# => graphics
		def build_board
			@board = 8.times.map { Array.new(8, ".") }
		end

		def show_board
			puts (0..7).to_a.join("\t")
			puts ("A".."H").to_a.join("\t")
			@board.each_with_index { |line, i| puts "#{line.join("\t")} #{i} \n\n" }
		end

		def write_board(ary,trail=false)		# => CALLED BY KNIGHT_MOVES
			# puts "#{ary.join(",")} turn: #{@turn}" if trail
			trail ? @board[ary[1]][ary[0]] = @turn : @board[ary[1]][ary[0]] = "X"
			@turn += 1 if trail
		end
	end
	module Moving # => mechanics
		def knight_moves(ary)				# => calls write_board and handles the trail
			kp = @knight_position
			write_board(kp,true)
			@knight_position = ary 		# => also updates @knight_position
			write_board(ary)
		end

		def moves_range(ary,option) # => the whole range of possible moves (even not valid ones)
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

		def is_valid?(ary) 					# => check if the move is valid, returns a boolean
			if (ary[0] > 7) or (ary[1] > 7)
				return false 
			elsif @board[ary[1]][ary[0]] == "o"
				return false 
			else
				return true
			end
		end

		def circle_run_test					# => just a test, not needed
			6.times do |i|
				move = moves_range(@knight_position,i)
				if is_valid?(move)
					knight_moves(move)
				end
			end
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
# old tests
	# horse.move(2,3,true)
	# horse.knight_moves(2,3)
	# horse.knight_moves(2,1)
	# horse.knight_moves([2,1])
	# horse.knight_moves([4,2])
	# horse.move([2,3],true)
	# horse.circle_run_test
horse.show_board
