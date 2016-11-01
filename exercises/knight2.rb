class Knight_Travels
	# => X and Y are INVERTED: @board[y][x]
	module Board
		def build_board
			@board = 8.times.map { Array.new(8, ".") }
		end

		def show_board
			puts (0..7).to_a.join(" ")
			puts ("A".."H").to_a.join(" ")
			@board.each_with_index { |line, i| puts "#{line.join(" ")} #{i}" }
		end

		def write_board(ary,trail=false)		# => CALLED BY KNIGHT_MOVES
			trail ? @board[ary[1]][ary[0]] = "o" : @board[ary[1]][ary[0]] = "X"
		end
	end
	module Moving


		def knight_moves(ary)				# => calls write_board and handles the trail
			kp = @knight_position
			write_board(kp,true)
			@knight_position = ary 		# => also updates @knight_position
			write_board(ary)
		end

		def moves_range(ary,option)
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
			end
		end
					# => IMPLEMENT CIRCLE RUN TEST WITH IS VALID
		def circle_run_test
			# knight_moves([2,1])
			# knight_moves([3,2])
			# puts @knight_position.join(",")
			# puts moves_range(@knight_position,7).join(",")
			# puts @knight_position.join(",")
			# knight_moves(moves_range(@knight_position,7))
			# knight_moves(moves_range([3,4],7))
			# knight_moves(moves_range(@knight_position,7))
			8.times do |i|
				move = moves_range(@knight_position,i)
				if is_valid?(move)
					knight_moves(move)
				end
				# knight_moves(moves_range([3,4],i))
				# knight_moves([4,2])
			end
		end
	end
	include Board
	include Moving

	def initialize
		build_board
		@knight_position = [3,4]
		write_board(@knight_position)		# => the first time gets kickstarted to bypass the trail
		@turn = 0
		# show_board
	end
end

horse = Knight_Travels.new
# horse.move(2,3,true)
# horse.knight_moves(2,3)
# horse.knight_moves(2,1)
# horse.knight_moves([2,1])
# horse.knight_moves([4,2])
# horse.move([2,3],true)

horse.circle_run_test

horse.show_board
