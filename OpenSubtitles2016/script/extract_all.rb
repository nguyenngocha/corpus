#copy file ra thu muc crawler roi chay
name = "GOME"

def extract_folder folder_name
  Dir.entries(folder_name).each do |a|
	if (!File.directory? a) && (!a.include?"xml")&&(!a.include?".rb")
	    extract_folder (folder_name + "/" + a)
	elsif a.include?"xml.gz"
		puts `gunzip #{folder_name}/#{a}`	
	end
  end
end

extract_folder name