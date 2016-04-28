require 'open-uri'
require 'nokogiri'

link = File.open("link.txt","w")

doc = Nokogiri::XML(File.read("corpus/ja-vi.xml"))
ss = doc.xpath("//link")
ss.each do |s|
	if !s.attr("xtargets").include?(" ")
		link.puts s.attr("xtargets")
	end
end
# ss.each do |s| 
# 	file_out.print s.attr("id").gsub("s","")
# 	file_out.puts s.text
# 	file_out.print "\n"
# end
