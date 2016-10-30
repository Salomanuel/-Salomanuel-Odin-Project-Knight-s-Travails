class ChessBoard
	def initialize
		@board = 8.times.map { Array.new(8, ".") }
		mark(3,4)
	end

	def letters(letter)
		return ("a".."h").to_a.index(letter.downcase)
	end

	def mark(x, y)
		x = letters(x) if x.is_a?(String)
		@board[y][x] = "X"
	end

	def show_board
		puts ("A".."H").to_a.join(" ")
		@board.each_with_index { |line, i| puts "#{line.join(" ")} #{i}" }
	end

	def check_validity
		return false if @x > 7
		return false if @y > 7
		return false if @board[@x][@y] == "o"
		return true
	end

	def knight_walk
		# BUILD TWO METHODS: 
		# 	ONE FOR CHECKING BOUNDARIES
		# 	THE OTHER FOR CHECKING FREE MOVES

		if check_validity
			puts "julio"
			@x += 2
			@y += 2
			mark
		end
	end
end

chess = ChessBoard.new
# chess.knight_walk
# chess.knight_walk
# puts chess.letters("E")
chess.mark("E",5)
chess.show_board

