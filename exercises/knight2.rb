# add START and FINISH positions

class KnightTravels
	# => X and Y are INVERTED: @board[y][x]
	require_relative "board"
	require_relative "moving"
	include Board 	# => graphics
	include Moving 	# => mechanics

	def initialize
		@turn = 1
		build_board
		@knight_position = [3,4]
		write_board(@knight_position)		# => the first time gets kickstarted to bypass the trail
		# show_board
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
	horse.circle_run_test
horse.show_board

