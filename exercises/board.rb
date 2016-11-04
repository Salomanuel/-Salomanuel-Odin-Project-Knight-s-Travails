module Board 	# => graphics
	def build_board
		@board = 8.times.map { Array.new(8, ".") }
	end

	def show_board
		puts (0..7).to_a.join("\t")
		puts ("A".."H").to_a.join("\t")
		@board.each_with_index { |line, i| puts "#{line.join("\t")} #{i} \n\n" }
	end

	def write_board(ary,trail=nil)		# => CALLED BY KNIGHT_MOVES
		# puts "#{ary.join(",")} turn: #{@turn}" if trail
		# no trail = increasing turn number		
		case trail
		when "p" then @board[ary[1]][ary[0]] = "X"
		when "s" then @board[ary[1]][ary[0]] = "S"
		when "f" then @board[ary[1]][ary[0]] = "F"
		else
			@board[ary[1]][ary[0]] = @turn
			@turn += 1 if trail
		end
	end
end