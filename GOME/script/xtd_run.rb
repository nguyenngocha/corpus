folder_name = "../"

def xmltodoc folder_name
  Dir.entries(folder_name).each do |a|
	if (!File.directory? a) && (!a.include?"xml")&&(!a.include?".rb") &&(!a.include?".txt")
	    xmltodoc (folder_name + "/" + a)
	elsif a.include?"xml"
		puts `ruby xtd_not_run.rb #{folder_name}/#{a}`
	end
  end
end

xmltodoc folder_name
