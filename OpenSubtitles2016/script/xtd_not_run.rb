require 'open-uri'
require 'nokogiri'

file_in = ARGV.first
name_out = file_in.gsub("xml","txt")
file_out = vi = File.open(name_out,"w")

def xmltotext( file_in, file_out )
	doc = Nokogiri::XML(File.read(file_in))
	ss = doc.xpath("//s")

	ss.each do |s| 
		file_out.puts s.attr("id").gsub("s","")
		s.text.each_line do |line|
 			unless line.strip.empty?
 				file_out.puts line.gsub(" ","")
 			end
		end
		file_out.print "\n"
	end
end

xmltotext( file_in, file_out)
puts "success xtd file #{file_in}"
#..//ja/2015/4120524/6116473.xml