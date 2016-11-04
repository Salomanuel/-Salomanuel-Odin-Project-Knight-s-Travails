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
		# @knight_position = [3,4]
		# write_board(@knight_position)		# => the first time gets kickstarted to bypass the trail
		# show_board
	end

	def win(node)
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

	def game(start, finish)
		@start  = start
		@finish = finish
		write_board(start,  "s")
		write_board(finish, "f")
		@knight_position = start
		route(start,finish)
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

horse.show_board