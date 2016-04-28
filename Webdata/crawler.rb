file = open("links.txt", "r")
file.each do |link|
	puts `python login.py #{link}`
end