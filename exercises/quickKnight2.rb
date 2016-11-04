require_relative "moving"
require_relative "board"

include Moving
include Board

module Routing
	class Node
		attr_accessor :value, :parent, :child
		def initialize(value=nil,parent=nil,child=[])
			@value  = value
			@parent = parent
			@child  = child
		end
	end

 def route(start,finish)
 	found 	 = false
 	@queue 	 = []
 	@current = Node.new(start)
 	counter = 0

 	loop do
 		@routes = moves_range(@current.value,9)
 		@routes.each do |route|
 			new_node = Node.new(route,@current)
 			@current.child << new_node

 			counter += 1
 			# if @board[route[1],route[0]] == "F"
 			# 	win_method
 			# 	found = true
 			# 	break
 			# end
 			@queue << new_node
 		end
 		# break if found
 		break if counter >= 10
 		@current = @queue.shift
	end
	# puts @current.child.size
 end
end
include Routing

# route([4,4],[1,2]).each { |i| puts i.join(",")}
route([4,4],[1,2])#.each { |i| puts i.join(",")}