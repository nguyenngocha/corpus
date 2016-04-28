folder_corpus = "ja"

def add_file( file_from, link_to )
	from = File.open(file_from, "r")
	from.each do |line|
		link_to.puts line
	end
end

new_file_ja = File.open("corpus.ja","w")
new_file_vi = File.open("corpus.vi","w")

Dir.entries(folder_corpus).each do |file_in|
	folder_corpus_ja = "ja/" + file_in
	if !File.directory? folder_corpus_ja
		add_file(folder_corpus_ja, new_file_ja)
		add_file(folder_corpus_ja.gsub("ja","vi"), new_file_vi)
		puts "success add file #{file_in}"
	end
end

# add_file("corpus/ja/gedit.gnome-2-28.corpus", new_file)

# puts (folder_corpus + "/gedit.gnome-2-28.corpus")
# add_file( folder_corpus + "/gedit.gnome-2-28.corpus", new_file)
