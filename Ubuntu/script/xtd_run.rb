folder_name = "../"

def folder_name_full( folder_name, path )
	folder_name + "/" + path
end

def xmltodoc folder_name
	folder_ja = folder_name_full(folder_name, "ja")
	folder_vi = folder_name_full(folder_name, "vi")

	Dir.entries(folder_ja).each do |a|
		if a.include?"xml"
			puts `ruby xtd_not_run.rb #{folder_name_full(folder_ja,a)}`
		end
	end
	Dir.entries(folder_vi).each do |a|
		if a.include?"xml"
			puts `ruby xtd_not_run.rb #{folder_name_full(folder_vi,a)}`
		end
	end
end

xmltodoc folder_name