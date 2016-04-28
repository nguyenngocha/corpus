# class String
#   def contains_cjk?
#     !!(self =~ /\p{Han}|\p{Katakana}|\p{Hiragana}|[」「’；・。、]/)
#   end
# end

# strings= ['日本', '僕はゴックhaです', 'です']
# strings.each{|s| puts s.contains_cjk?}

#true
#true
#true


file = File.open("..//corpus_ja/gnome-nettool.gnome-2-32/gnome-nettool.gnome-2-32.txt","r")
file.each do |x|
	puts x
end

