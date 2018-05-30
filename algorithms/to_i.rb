=begin
	Implment Rubys String#to_i method.

	Given the method char_to_i, write a method called string_to_int, that takes a string as an argument and returns the Integer
	representation of that String.

	ex:

	'12345' (String) => 12345 (Integer/Fixnum)

	'9687392547924324' (String) => 9687392547924324

=end

def str_to_int(str)
  int = 0
  str.split('').reverse.each_with_index do |char, index|
  	int += char_to_int(char) * 10 ** index
  end
  int
end

def char_to_int(char)
  char.to_i
end
