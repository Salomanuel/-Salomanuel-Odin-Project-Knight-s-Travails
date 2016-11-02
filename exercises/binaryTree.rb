class BinarySearchTree
	class Node
		attr_reader :value, :nodes
		# attr_reader :node1, :node2, :node3, :node4
		# attr_reader :node5, :node6, :node7, :node8

		def initialize(value)
			@value = value.join.to_s if value.is_a?(Array)
			@node0,@node1,@node2,@node3 = nil
			@node4,@node5,@node6,@node7 = nil
			@nodes = []
		end

		def insert(value)
			if nodes.include?(value)
				raise "** cell already found earlier"
			else
				@nodes << value
				case
				when @node0.nil? then @node0 = Node.new(value)
				when @node1.nil? then @node1 = Node.new(value)
				when @node2.nil? then @node2 = Node.new(value)
				when @node3.nil? then @node3 = Node.new(value)
				when @node4.nil? then @node4 = Node.new(value)
				when @node5.nil? then @node5 = Node.new(value)
				when @node6.nil? then @node6 = Node.new(value)
				when @node7.nil? then @node7 = Node.new(value)
				else 
					raise "** all the nodes are occupied, wtf?!"
				end
			end
		end
	end
	attr_accessor :root
	def initialize
		@root = nil
	end

	def insert(value)
		if @root == nil
			@root = Node.new(value)
		else
			@root.insert(value)
		end
	end
end

tree = BinarySearchTree.new

tree.insert(4)
tree.insert(3)