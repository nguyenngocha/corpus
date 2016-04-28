require 'open-uri'
require 'nokogiri'

def get_links link, file
	doc = Nokogiri::HTML(open(link))
	wlinks = doc.css("div.post-alt/a/@href")
	wlinks.each do |wlink|
		file.puts wlink
	end	
end


file = open("links.txt", "w")
# more_entries
link1 = 'http://thegioisongngu.com/category/%E6%97%A5%E6%9C%AC%E8%AA%9E/'
link2 = 'http://thegioisongngu.com/category/%E6%97%A5%E6%9C%AC%E8%AA%9E/page/2'

get_links link1, file

get_links link2, file
