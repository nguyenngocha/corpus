vi = File.open( "vi.text", "r" )
ja = File.open( "ja.text", "r" )
link = File.open( "link.txt", "r" )

hash_vi = Hash.new
hash_ja = Hash.new
hash_link = Hash.new 


def read_file_to_hash( file_name, hash )
  i = 0
  link = String.new
  text = String.new

  file_name.each do |line|
    if line == "\n"
    	i = 0
    	hash[link] = text
    	link = ""
    	text = ""
    else
    	if i == 0
    	  link += line.chomp
    	else
    	  text += line.chomp
    	end
  	  i += 1
    end
  end
end

#VI = BUFF[1]
#ja = buff[0]
def read_file_link( file_name, hash )
  file_name.each do |line|
    buff = line.split(";")
    hash[buff[0].gsub("s","")] = buff[1].gsub("s","").gsub("\n","")
  end
end

read_file_to_hash( vi, hash_vi )
read_file_to_hash( ja, hash_ja )
read_file_link( link, hash_link )
hash_data = Hash.new

hash_link.each do |ja_link, vi_link|
  if !hash_vi.keys.include?(vi_link) || !hash_ja.keys.include?(ja_link)
    next
  else
    hash_data[hash_vi[vi_link]] = hash_ja[ja_link] 
  end
end

print hash_data

fout_vi = File.open("out.vi", "w")
fout_ja = File.open("out.ja", "w")

hash_data.each do |out_vi, out_ja|
  fout_ja.puts( out_ja + "\n" )
  fout_vi.puts( out_vi + "\n" )
end 