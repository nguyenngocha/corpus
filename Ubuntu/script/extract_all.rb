name = "../"

def extract_folder folder_name
  Dir.entries(folder_name).each do |a|
 	if !a.include?"."
 	  extract_folder (folder_name + "/" + a)
 	elsif a.include?"xml.gz"
 		if puts `gunzip #{folder_name}/#{a}`
 			puts "success extract folder #{folder_name}"
	end
  end
end

extract_folder name

