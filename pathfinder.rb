# => in Node, add error if the value is not a cell

#test
	# require_relative "moving"
	# require_relative "board"
	# include Moving
	# include Board

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

 	loop do
 		# sleep 0.05
 		# puts "#{@current.value.join(",")} vs #{finish.join(",")}"
 		@routes = moves_range(@current.value,9)
 		@routes.each do |route|
 			new_node = Node.new(route, @current)
 			@current.child << new_node
 			if route == finish	# => you can put @finish
 				win(new_node)# => actually it's better to put @finishers
 				found = true
 				break
 			end
 			@queue << new_node
 		end
 		break if found
 		@current = @queue.shift
	end
 end
end



# include Routing
	# route([4,4],[1,2]).each { |i| puts i.join(",")}
	# route([4,4],[1,2])#.each { |i| puts i.join(",")}