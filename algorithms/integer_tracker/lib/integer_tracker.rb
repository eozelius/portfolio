class IntegerTracker
	attr_reader :min, :max, :mean, :mode, :count, :integers

	def initialize
		@min = Float::INFINITY
		@max = -Float::INFINITY
		@mean = 0
		@mode = 0
		@count = 0
		@integers = Hash.new(0)
	end

	def track(int)
		update_min(int)
		update_max(int)
		update_mean(int)
		update_mode(int)

		@count += 1
	end

	def get_max
		@max
	end

	def get_min
		@min
	end

	def get_mean
		@mean
	end

	def get_mode
		@mode
	end

	private 

	def update_min(int)
		@min = int if int < @min
	end

	def update_max(int)
		@max = int if int > @max
	end

	def update_mean(int)
		sum = @mean * @count
		sum += int
		@mean = sum.to_f / (@count + 1)
		new_count = (@count + 1).to_f	

		@mean = (@mean * (@count / new_count)) + (int / new_count)
	end

	def update_mode(int)
		@integers[int] += 1
		@mode = int if @integers[int] > @integers[@mode] 
	end
end
=begin
integer_tracker = IntegerTracker.new

integer_tracker.track(4)
integer_tracker.track(5)
integer_tracker.track(15)
integer_tracker.track(15)

p "get_max: #{integer_tracker.get_max}"
p "min: #{integer_tracker.get_min}"
p "mean: #{integer_tracker.get_mean}"
p "mode: #{integer_tracker.get_mode}"

=end


