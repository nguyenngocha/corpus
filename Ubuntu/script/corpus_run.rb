folder_name = "../"

def folder_name_full( folder_name, path )
	folder_name + "/" + path
end

def corpus folder_name
	folder_ja = folder_name_full(folder_name, "ja")
	folder_vi = folder_name_full(folder_name, "vi")

	Dir.entries(folder_ja).each do |a|
		if a.include?"txt"
			puts `ruby corpus_not_run.rb #{folder_name_full(folder_ja,a)} #{folder_name_full(folder_vi,a)}`
		end
	end
end

corpus folder_name