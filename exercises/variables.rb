	class DoNotUnderstand
		def initialize
			@tiny_array = [3,4]
			test
		end

		def messing(ary)
			return [ary[0]+=700, ary[1]+=999]
		end

		def test
			puts @tiny_array.join(",")	# => 3,4
			messing(@tiny_array)
			puts @tiny_array.join(",")  # => 703,1003
		end
	end

	question = DoNotUnderstand.new

	puts "*"*30

	@tiny = [1,2]
	def messing(ary)
		return [ary[0]+693,ary[1]+999]
	end

	puts @tiny.join(",")						# => 1,2
	messing(@tiny)
	puts @tiny.join(",") 						# => 1,2

