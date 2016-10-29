class ChessBoard
	def initialize
		letters
		@oldX  = nil
		@oldY  = nil
		@x = @d
		@y =  4
		@board = []
		8.times { @board << Array.new(8, ".") }
		mark
	end

	def letters
		@a = 0
		@b = 1
		@c = 2
		@d = 3
		@e = 4
		@f = 5
		@g = 6
		@h = 7
	end

	def mark
		@board[@oldY][@oldX] = "o" if !@oldY.nil?
		@board[@y][@x]       = "X"
		@oldX = @x
		@oldY = @y
	end

	def show_board
		puts ("A".."H").to_a.join(" ")
		@board.each_with_index { |line, i| puts "#{line.join(" ")} #{i}" }
	end
end

chess = ChessBoard.new
chess.show_board