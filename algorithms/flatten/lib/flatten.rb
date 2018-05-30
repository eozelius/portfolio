def flatten(array, return_array = [])
	array.each do |a|
		if a.class == Array
			flatten(a, return_array)
		else
			return_array.push a # base case
		end
	end
	return_array
end