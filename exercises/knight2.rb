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
	end


	include Board

	def initialize
		build_board
		@knight_position = [3,4]
		# show_board
	end

	def move(x,y,trail=false)		# => CALLED BY KNIGHT_MOVES
		trail ? @board[y][x] = "o" : @board[y][x] = "X"
	end

	def knight_moves(x,y)
		kp = @knight_position
		move(kp[0],kp[1],true)
		@knight_position = [x,y]
		move(x,y)
	end



end

horse = Knight_Travels.new
# horse.move(2,3,true)
horse.knight_moves(2,3)
horse.knight_moves(2,1)

horse.show_board