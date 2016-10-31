class ChessBoard
	# => board x and y are inverted
	module Board
		def create_board
			@board 		 = 8.times.map { Array.new(8, ".") }
		end

		def mark(x, y, old=false)	# DRAWS ON THE BOARD
			old ? @board[y][x] = "o" :	@board[y][x] = "X" 
		end

		def show_board
			puts ("A".."H").to_a.join(" ")
			puts (0..7).to_a.join(" ")
			@board.each_with_index { |line, i| puts "#{line.join(" ")} #{i}" }
		end
	end
	module Input
		def input(x,y)
			x = letters(x) if x.is_a?(String)
			mark(x,y)
			@knight_position = [x,y]
		end

		def input(x,y)						# handles old and new markings
			@old_moves ||= []
			x = letters(x) if x.is_a?(String)
			if @old_moves.length > 0
				old = @old_moves.last 
				mark(old[0],old[1],true)
			end
			@old_moves << [x,y]
			mark(x,y)
		end

		def letters(letter)				# WHEN SOME INPUT IS A LETTER
			return ("a".."h").to_a.index(letter.downcase)
		end
	end
	module Moves
	# 	def possible_moves(x,y,try=0)
	# 		case try
	# 		when 0 then return x+=1, y-=2	
	# 		when 1 then return x+=2, y-=1
	# 		when 2 then return x+=2, y+=1	
	# 		when 3 then return x+=1, y+=2
	# 		when 4 then return x-=1, y+=2	
	# 		when 5 then return x-=2, y+=1	
	# 		when 6 then return x-=2, y-=1
	# 		when 7 then return x-=1, y-=2
	# 		end
	# 	end

	# 	def knight_walk
	# 		# puts "***#{@board[5][4]}"
	# 		8.times do |i|
	# 			puts possible_moves()

	# 		end
	# 		# BUILD TWO METHODS: 
	# 		# 	ONE FOR CHECKING BOUNDARIES
	# 		# 	THE OTHER FOR CHECKING FREE MOVES

	# 	end

	# 	def check_validity
	# 		return false if @x > 7
	# 		return false if @y > 7
	# 		return false if @board[y][x] == "o"
	# 		return true
	# 	end

	# end

	include Board
	include Input
	include Moves

	def initialize
		create_board
		@knight_position = [4,3]
		input(3,4)							# JUST TO CALL MARK
	end

end

chess = ChessBoard.new
# chess.knight_walk
# chess.knight_walk
# puts chess.letters("E")
chess.input("E",5)
chess.input("F",6)
chess.show_board
chess.knight_walk

