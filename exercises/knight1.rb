class ChessBoard
	def initialize
		a = 0
		b = 1
		c = 2
		d = 3
		e = 4
		f = 5
		g = 6
		h = 7
		@board = []
		8.times { @board << Array.new(8, ".") }
	end

	def show_board
		puts ("A".."H").to_a.join(" ")
		@board.each_with_index { |line, i| puts "#{line.join(" ")} #{i}" }
	end
end

chess = ChessBoard.new
chess.show_board