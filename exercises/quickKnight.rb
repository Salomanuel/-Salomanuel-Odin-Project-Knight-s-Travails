module QuickKnight

	def sons(start_square)
		8.times.map do |i| 
			move = moves_range(start_square, i)
			move if is_valid?(move)
		end
	end

	def quickKnight(start,finish)
		build_board  #temporary
		@start   = start
		@finish  = finish
		@enders  = sons(@finish)
		starters = sons(@start)
		# starters.each{ |u| puts "#{u}" }
		# @enders.each{ |u| puts "#{u}" }
	end

	def has_enders?(square)
		@enders.include?(square)
	end

	def compare(squares=sons(@start))
		squares.each do |square| 
			if has_enders?(square)
				formatting_result(square) 
			end
		end
	end

	def formatting_result(square)
		puts "#{@start.join(",")} => #{square.join(",")} => #{@finish.join(",")}"
	end

	

		# you can make this recursive
			

end
require_relative "board"
require_relative "moving"
include Board
include Moving
include QuickKnight

# quickKnight([4,4],[1,2])
quickKnight([2,3],[1,2]) # => this has just one move
# puts is_valid?([4,4])
# starters = neighbors(@start)
# enders = neighbors(@finish)
# puts has_enders?([3,4])
compare#(sons([2,3]))

#.each { |s| puts s.join(",") }