source = "../ja"

def corpus folder_name
	Dir.entries(folder_name).each do |a|
		if a.include? ".corpus"
			file_in_ja = folder_name + "/" + a
			file_out_ja = "ja/" + a
			file_in_vi = file_in_ja.gsub("ja","vi")
			file_out_vi = "vi/" + a
			puts `cp #{file_in_ja} #{file_out_ja}`
			puts `cp #{file_in_vi} #{file_out_vi}`
		elsif (!File.directory? a) && (!a.include?"xml")&&(!a.include?".rb")&&(!a.include?"txt")&&(a!="vi")
			corpus (folder_name + "/" + a)	
		end
	end
end

corpus source