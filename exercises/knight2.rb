# add START and FINISH positions
# add interface

class KnightTravels
	# => X and Y are INVERTED: @board[y][x]
	require_relative "board"
	require_relative "moving"
	require_relative "quickKnight2"
	include Board 	# => graphics
	include Moving 	# => mechanics
	include Routing # => path handling

	def initialize
		@turn = 1
		build_board
		# @knight_position = [3,4]
		# write_board(@knight_position)		# => the first time gets kickstarted to bypass the trail
		# show_board
	end

	def win
		puts "CULO"
	end

	def game(start, finish)
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