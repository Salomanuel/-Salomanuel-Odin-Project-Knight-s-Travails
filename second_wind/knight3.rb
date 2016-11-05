class DamnHorse
	module Board
		def initialize # => only called by super in initialize of the main class
			create_board
			show_board
		end

		def create_board
			@board = 8.times.map { Array.new(8,".") }
		end

		def show_board
			puts "  #{("A".."H").to_a.join(" ")}"
			puts "  #{(0..7).to_a.join(" ")}"
			@board.each_with_index { |line,i| puts "#{i} #{line.join(" ")}" }
		end

		def draw_board(cell=@start,type=nil)
			case type
			when "S" then @board[cell[1]][cell[0]] = "S"
			when "F" then @board[cell[1]][cell[0]] = "F"
			when "X" then @board[cell[1]][cell[0]] = "X"
			else
										@board[cell[1]][cell[0]] = @turn
			end
		end
	end

	module Moving
		def initialize
			super
			@turn = 1
		end

		def moves_range(cell)
			#cell
		end
	end

	module Input
		def initialize
			super
			# @start  = [4,4]
			@start =  [3,4] # => D4
			@finish = [1,2]
		end
	end

	include Board
	include Moving
	include Input

	def initialize
		super 				# => calls the initialize of the modules
	end
end

horse = DamnHorse.new

horse.draw_board
horse.show_board