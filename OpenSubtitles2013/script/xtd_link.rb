require 'open-uri'
require 'nokogiri'

file_in = "../ja-vi.xml"
file_out = File.open("link.txt","w")

def xmltotext(file_in, file_out)
	doc = Nokogiri::XML(File.read(file_in))
	ss = doc.xpath("//linkGrp")
    ss.each do |block|
	    link_ja = ("../" + block.attr("fromDoc").gsub("xml.gz","txt"))
	    link_vi = ("../" + block.attr("toDoc").gsub("xml.gz","txt"))
	    file_out.puts(link_ja + "|" + link_vi)
	    link_out = File.open("#{link_ja.gsub("txt","link")}","w")
	    block.elements.to_a.each do |xml|
	        link = xml.attr("xtargets")
	        link_array = link.split(";")
		    ja = link_array[0]
		    vi = link_array[1]
		    if (ja.length == 0 || vi.nil?)
		    	next
		    else
		    	link_out.puts (ja + "|" + vi)
		    end
		end
	end
end

xmltotext(file_in, file_out)
