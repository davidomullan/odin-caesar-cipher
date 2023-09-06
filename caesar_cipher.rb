# Caesar Cipher
# "[T]akes in a string and the shift factor and then outputs the modified string"

# caesar_cipher
# 	Substitution cipher in which each letter in the plaintext is replaced by a
# 	 letter some fixed number of positions down the alphabet.
# Parameters: String string (A user provided string)
#             Integer shift (A user provided integer)
# Return value: String string (String after shifting letters)
def caesar_cipher(string, shift)
	shift = shift % 26
	string.each_char { |c| 
		c_ascii = c.ord
		# Uppercase Letters
		if (c_ascii >= 65 and c_ascii <= 90)
			c_shifted = c_ascii + shift
			if c_shifted > 90
				string[c] = (c_shifted - 26).chr
			else
				string[c] = c_shifted.chr
			end
		# Lowercase letters
		elsif (c_ascii >= 97 and c_ascii <= 122)
			c_shifted = c_ascii + shift
			if c_shifted > 122
				string[c] = (c_shifted - 26).chr
			else
				string[c] = c_shifted.chr
			end
		else
			# Non letter characters unchanged
		end
	}
	return string
end

# Only executed when file is run from command line
if __FILE__ == $0
	puts "Provide a string to be encrypted with the caesar cipher: "
	user_string = gets
	while !user_string.is_a? String
		puts "Provide a string to be encrypted with the caesar cipher: "
		user_string = gets
	end

	puts "Provide an integer for the amount to be shifted: "
	user_shift = gets.to_i
	while !user_shift.is_a? Numeric or user_shift == 0
		puts "Provide an integer for the amount to be shifted: "
		user_shift = gets.to_i
	end
  puts caesar_cipher(user_string, user_shift)
end