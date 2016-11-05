class DamnHorse
	module Board
		def initialize # => BOARD INITIALIZE only called by super in initialize of the main class
			super
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

		def draw_board(cell,type=nil)
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
		def Initialize # => MOVING initialize
			super
			@turn = 1
		end

		def valid_move?(cell)
			x, y = cell[0], cell[1]
			return false unless (0..7).include?(x) and (0..7).include?(y) 
			return true
		end

		def moves_range(cell)
			x, y  = cell[0], cell[1]
			range = []
			8.times do |i|
				case i
				when 0 then range << [x+1, y-2]
				when 1 then range << [x+2, y-1]
				when 2 then range << [x+2, y+1]
				when 3 then range << [x+1, y+2]
				when 4 then range << [x-1, y+2]
				when 5 then range << [x-2, y+1]
				when 6 then range << [x-2, y-1]
				when 7 then range << [x-1, y-2]
				end
			end
			return range.each.map{ |c| c if valid_move?(c) }.compact
		end
	end

	module Input
		def initialize	# => Input Initialize
			super
			@start  = [4,4]
			# @start =  [3,4] # => D4
			@finish = [1,2]
		end
	end

	include Board
	include Moving
	include Input

	def initialize  # => MAIN initialize
		super 				# => calls the initialize of the modules
		draw_board(@start,  "S")
		draw_board(@finish, "F")
		
		# moves_range(@start).each  { |node| draw_board(node, "X") }
		moves_range(@finish).each { |node| draw_board(node, "X") }
		show_board
	end
end

horse = DamnHorse.new

# horse.draw_board
