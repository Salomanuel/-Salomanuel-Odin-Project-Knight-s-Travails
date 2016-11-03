module QuickKnight

	def sons(start_ary)
		8.times.map do |i| 
			move = moves_range(start_ary, i)
			move if is_valid?(move)
		end
	end

	def quickKnight(start,finish)
		build_board
		@start   = start
		@finish  = finish
		@enders  = sons(@finish)
		starters = sons(@start)
		# starters.each{ |u| puts "#{u}" }
		@enders.each{ |u| puts "#{u}" }
	end

	def compare_arrays
		# you can make this recursive
	end
			

end
require_relative "board"
require_relative "moving"
include Board
include Moving
include QuickKnight

quickKnight([4,4],[2,1])
# puts is_valid?([4,4])
# starters = neighbors(@start)
# enders = neighbors(@finish)

