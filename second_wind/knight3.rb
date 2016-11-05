class DamnHorse
	module Board
		def initialize # => BOARD INITIALIZE only called by super in initialize of the main class
			super
			create_board
			show_board
			@turn = 1
		end

		def create_board
			@board = 8.times.map { Array.new(8,".") }
		end

		def show_board
			puts "  #{("A".."H").to_a.join(" ")}"
			puts "  #{(0..7).to_a.join(" ")}"
			@board.each_with_index { |line,i| puts "#{i} #{line.join(" ")}" }
		end

		def board_query(cell)
			return @board[cell[1]][cell[0]]
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
		def valid_move?(cell)
			x, y = cell[0], cell[1]
			return false unless (0..7).include?(x) and (0..7).include?(y) 
			return true
		end

		def moves_range(cell) # returns only valid moves
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

	module Path
		class Node
			attr_accessor :value, :child, :parent
			def initialize(value)
				@value = value
				@child,@parent = nil
			end
		end

		def initialize # => PATH initialize
			super
		end

		def knight_moves(cell)
			found    = false
			@queue   = []
			@current = Node.new(cell)

			loop do
				@sons = moves_range(@current.value)
				@sons.each do |son|
					new_node = Node.new(son)
					@current.child  = new_node
					new_node.parent = @current
					if board_query(son) == "F"
						# puts "win!"
						win
						found = true
						break
					end
					@queue << new_node
				end
				@current = @queue.shift
				break if found
			end
		end
	end

	include Board
	include Moving
	include Input
	include Path

	def initialize  # => MAIN initialize
		super 				# => calls the initialize of the modules
		draw_board(@start,  "S")
		draw_board(@finish, "F")
		
		knight_moves(@start)
		show_board
	end

	def win
		list = []
		while @current.parent != nil
			list << @current
			@current = @current.parent
		end
		list.reverse.each do |node| 
			puts node.value.join(",") 
			draw_board(node.value)
			@turn += 1
		end
	end
end

horse = DamnHorse.new