file = open("data.html", "r")
f_vi = open("data.vi", "w")
f_ja = open("data.ja", "w")

i = 1
file.each do |line|
	if i%2 == 0
		f_vi.write(line)
	else
		f_ja.write(line)
	end
	i += 1
end