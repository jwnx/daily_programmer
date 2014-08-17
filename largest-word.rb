
def sort(w,l)

	w.select! do |word|
		word.chars.all? {|char| word.count(char) <= l.count(char)}
	end

	# w.each do |word|
	# 	wc = 0

	# 	(0...l.length).each do |n| 
	# 		wc += 1 if word =~ /#{l[n]}/ 
	# 	end

	# 	if wc == word.length
	# 	 	largest << word
	# 	end
	# end
	

	if !w.empty?
		max = w.max_by(&:length).length
		puts w.find_all{|x| x.length == max }
	end
	
	puts "None found" if w.empty?
end

words = "hello yyyyyyy yzyzyzyzyzyz mellow well yo kellow lellow abcdefhijkl hi is yellow just here to add strings fellow lellow llleow"
letters = "l e l o h m f y z a b w"

sort(words.split, letters)
