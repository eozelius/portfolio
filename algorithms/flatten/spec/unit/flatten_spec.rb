require_relative '../../lib/flatten'

RSpec.describe 'flatten function' do
	let(:already_flat){ [5, 6, 0, 2, 9] }
	let(:two_d_array) { [8, 7, [0, 7, 5], 77] }
	let(:flat_two_d_array) { [8, 7, 0, 7, 5, 77] }
	let(:multi_d_array) { [2, 3, [4, [1, 6, 0, [2]], 5]] }
	let(:flat_multi_d_array) { [2, 3,  4,  1, 6, 0,  2,   5] }

	context 'Array is already flat' do
		it 'returns an already flat array' do
			flat = flatten(already_flat)
			expect(flat).to eq(already_flat)
		end
	end

	context 'Array is Not already flat' do
		it 'flattens a 2-D Array' do
			flat = flatten(two_d_array)
			expect(flat).to eq(flat_two_d_array)
		end

		it 'flattens multi-dimensional Arrays' do
			flat = flatten(multi_d_array)
			expect(flat).to eq(flat_multi_d_array)
		end
	end
end