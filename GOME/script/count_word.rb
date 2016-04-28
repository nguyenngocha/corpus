file_in_ja = "corpus.ja"
file_in_vi = "corpus.vi"

file_ja = File.open(file_in_ja)
file_vi = File.open(file_in_vi)

i_ja = 0
i_vi = 0
file_ja.each_char{|x|
	if ( x != "\n" ) && ( x != " " )
		i_ja +=1
	end
}

file_vi.each_char{|x|
	if ( x != "\n" ) || ( x != " " )
		i_vi +=1
	end
}

puts ("file #{file_in_ja} have: " + i_ja.to_s + " characters")
puts ("file #{file_in_vi} have: " + i_vi.to_s + " characters")
