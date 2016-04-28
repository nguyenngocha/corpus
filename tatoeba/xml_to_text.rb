require 'open-uri'
require 'nokogiri'


def xmltotext( file_in, file_out )
	doc = Nokogiri::XML(File.read(file_in))
	ss = doc.xpath("//s")

	ss.each do |s| 
		file_out.print s.attr("id").gsub("s","")
		file_out.puts s.text
		file_out.print "\n"
	end
end

file_ja = "corpus/ja.xml" 
file_vi = "corpus/vi.xml"
vi = File.open("vi.text","w")
ja = File.open("ja.text","w")

xmltotext( file_vi, vi )
xmltotext( file_ja, ja )