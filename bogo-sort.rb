def Bogo(mixed, right)

	iterations = 0

	# Random shuffle 'til gets the answer
	# (not my favorite)

	# iterations += 1 until mixed.chars.shuffle == right.chars

	# or... not random

	(0...right.length).each do |m| 

		letter = 0 

		while mixed[letter] != right[m]
			letter += 1 
			iterations += 1
		end

		iterations += 1
	end

	puts "You had #{iterations} iterations!"
end

mixed = ARGV[0]
right = ARGV[1]

Bogo(mixed, right)