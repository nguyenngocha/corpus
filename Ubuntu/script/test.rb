class String
  def contains_cjk?
    !!(self =~ /\p{Han}|\p{Katakana}|\p{Hiragana}|[」「’；・。、]/)
  end
end

strings= ['日本', '僕はゴックhaです', 'です']
strings.each{|s| puts s.contains_cjk?}

#true
#true
#true
