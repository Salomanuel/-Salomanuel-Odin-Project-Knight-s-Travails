# add interface

class KnightTravels
	# => X and Y are INVERTED: @board[y][x]
	require_relative "board"
	require_relative "moving"
	require_relative "pathfinder"
	include Board 	# => graphics
	include Moving 	# => mechanics
	include Routing # => path handling

	def initialize
		@turn = 0
		build_board
	end

	def win(node)		# => presents the cells of path along with the visualization
		@route = []

		loop do
			break if node.parent == nil
			@route << node
			node = node.parent
		end
		print "#{@start} => "
		@route.reverse.each do |n| 
			print "#{n.value} => " if n != @route.first
			print "#{n.value}" 		 if n == @route.first
			knight_moves(n.value)
			write_board(@start,  "s")
			write_board(@finish, "f")
		end
		puts
	end

	def game(start, finish) # => handles the game and calls many methods
		@start  = start
		@finish = finish
		@knight_position = start
		write_board(start,  "s")
		write_board(finish, "f")
		route(start,finish) 	# => pathfinding
		show_board 						# => graphics
	end

	
end

horse = KnightTravels.new
# old tests
	# horse.move(2,3,true)
	# horse.knight_moves(2,3)
	# horse.knight_moves(2,1)
	# horse.knight_moves([2,1])
	# horse.knight_moves([4,2])
	# horse.move([2,3],true)
	# horse.circle_run_test


horse.game([4,4],[1,2])
