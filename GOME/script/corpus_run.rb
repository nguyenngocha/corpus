folder_name = "../"

def folder_name_full( folder_name, path )
	folder_name + "/" + path
end

def corpus folder_name
	Dir.entries(folder_name).each do |a|
		if (!File.directory? a) && (!a.include?"xml")&&(!a.include?".rb")&&(!a.include?"txt")&&(a!="vi") 
			corpus (folder_name + "/" + a)	
		elsif a.include?"txt"
			link_ja = (folder_name + "/" + a)
			link_vi = link_ja.gsub("ja","vi")
			puts `ruby corpus_not_run.rb #{link_ja} #{link_vi}`
		end
	end
end

corpus folder_name
# aa

# Dir.entries(folder_ja).each do |a|
# 		if a.include?"txt"
# 			puts `ruby corpus_not_run.rb #{folder_name_full(folder_ja,a)} #{folder_name_full(folder_vi,a)}`
# 		end
# 	end

# Dir.entries(folder_name).each do |a|
# 	if (!File.directory? a) && (!a.include?"xml")&&(!a.include?".rb")
# 	    extract_folder (folder_name + "/" + a)
# 	elsif a.include?"xml.gz"
# 		puts `gunzip #{folder_name}/#{a}`	
# 	end
#   end