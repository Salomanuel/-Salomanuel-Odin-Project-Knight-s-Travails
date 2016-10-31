class Knight_Travels
	# => X and Y are INVERTED: @board[y][x]
	module Board
		def build_board
			@board = 8.times.map { Array.new(8, ".") }
		end

		def show_board
			puts (0..7).to_a.join(" ")
			puts ("A".."H").to_a.join(" ")
			@board.each_with_index { |line, i| puts "#{line.join(" ")} #{i}" }
		end
	end
	module Moving
		def move(ary,trail=false)		# => CALLED BY KNIGHT_MOVES
			trail ? @board[ary[1]][ary[0]] = "o" : @board[ary[1]][ary[0]] = "X"
		end

		def knight_moves(ary)				# => calls move and handles the trail
			kp = @knight_position
			move(kp,true)
			@knight_position = ary 		# => also updates @knight_position
			move(ary)
		end

		def moves_range(ary,option)
			puts "#{ary.join}, #{option}, #{[ary[0]+=1, ary[1]-=2]}"
			case option
				when 0 then return [ary[0]+=1, ary[1]-=2]
			# 	when 1 then return [ary[0]+=2, ary[1]-=1]
			# 	when 2 then return [ary[0]+=2, ary[1]+=1]
			# 	when 3 then return [ary[0]+=1, ary[1]+=2]
			# 	when 4 then return [ary[0]-=1, ary[1]+=2]
			# 	when 5 then return [ary[0]-=2, ary[1]+=1]
			# 	when 6 then return [ary[0]-=2, ary[1]-=1]
			# 	when 7 then return [ary[0]-=1, ary[1]-=2]
			end
			horse.show_board
		end

		def circle_run_test
			8.times do |i|
				# knight_moves(moves_range(@knight_position,i))
				# knight_moves(moves_range([3,4],i))
				# knight_moves([4,2])
			end
		end
	end
	include Board
	include Moving

	def initialize
		build_board
		@knight_position = [3,4]
		move(@knight_position)		# => the first time gets kickstarted to bypass the trail
		# show_board
	end
end

horse = Knight_Travels.new
# horse.move(2,3,true)
# horse.knight_moves(2,3)
# horse.knight_moves(2,1)
horse.knight_moves([2,1])
# horse.move([2,3],true)

horse.show_board
# horse.circle_run_test