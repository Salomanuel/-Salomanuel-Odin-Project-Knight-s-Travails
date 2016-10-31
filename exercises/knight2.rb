class Knight_Travels
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

	include Board

	def initialize
		build_board
		show_board
	end



end

horse = Knight_Travels.new