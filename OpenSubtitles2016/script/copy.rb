file_in = "link.txt"
file = File.open(file_in,"r")

file.each do |f|
	link = f.split("|")
	file_in_ja = link[0].gsub("txt","corpus")
	file_in_vi = link[1].gsub("txt","corpus").gsub("\n","")
	link_out_ja = "ja/" + file_in_ja.split("/")[-1] 
	link_out_vi = "vi/" + file_in_ja.split("/")[-1]
	puts `cp #{file_in_ja} #{link_out_ja}`
	puts `cp #{file_in_vi} #{link_out_vi}`
	# puts `mv #{link_out_vi} "vi"/#{file_in_ja.split("/")[-1]}`
	puts "success copy file #{file_in_ja} to #{link_out_ja}"
	puts "success copy file #{file_in_vi} to #{link_out_vi}"
end

 # cp ../vi/2015/478970/6374077.corpus vi/6374077.corpus