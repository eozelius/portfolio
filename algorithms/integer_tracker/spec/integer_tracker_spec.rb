require_relative '../lib/integer_tracker.rb'

RSpec.describe IntegerTracker do
	let(:integer_tracker) { IntegerTracker.new }

	it 'returns the min' do
		integer_tracker.track(5)
		integer_tracker.track(4)

		expect(integer_tracker.get_min).to eq(4)
	end

	it 'returns the max' do
		integer_tracker.track(10)
		integer_tracker.track(100)

		expect(integer_tracker.get_max).to eq(100)
	end

	it 'returns the mean' do 
		integer_tracker.track(25)
		integer_tracker.track(-25)

		expect(integer_tracker.get_mean).to eq(0)
	end

	it 'returns the mode' do
		integer_tracker.track(100)
		integer_tracker.track(100)
		integer_tracker.track(1)
		integer_tracker.track(12)
		integer_tracker.track(66)

		expect(integer_tracker.get_mode).to eq(100)	
	end
end