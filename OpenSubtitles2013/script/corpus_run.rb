link_file = File.open("link.txt","r")

link_file.each do |link_arr|
	link = link_arr.split("|")
	link_ja = link[0]
	link_vi = link[1]
	puts `ruby corpus_not_run.rb #{link_ja} #{link_vi}`
end