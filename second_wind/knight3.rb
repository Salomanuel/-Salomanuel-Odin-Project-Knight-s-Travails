class DamnHorse
	module Board
		def initialize # => only called by super in initialize of the main class
			create_board
			show_board
		end

		def create_board
			@board = 8.times.map { Array.new(8,".") }
		end

		def show_board
			puts "  #{("A".."H").to_a.join(" ")}"
			@board.each_with_index { |line,i| puts "#{i} #{line.join(" ")}" }
		end
	end

	include Board

	def initialize
		super 				# => calls the initialize of the modules
	end
end

horse = DamnHorse.new

