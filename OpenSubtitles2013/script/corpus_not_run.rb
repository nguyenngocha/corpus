file_in_ja = ARGV[0]
file_in_vi = ARGV[1]
file_link = file_in_ja.gsub("txt","link")

hash_vi = Hash.new
hash_ja = Hash.new
vi = File.open(file_in_vi, "r")
ja = File.open(file_in_ja, "r")

name_out_ja = file_in_ja.gsub("txt", "corpus")
name_out_vi = file_in_vi.gsub("txt", "corpus")

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
    	  text += (line.chomp + " ")
    	end
  	  i += 1
    end
  end
end

#VI = BUFF[1]
#ja = buff[0]
def read_file_link( file_name, hash )
  file = File.open(file_name,"r")
  file.each do |line|
    buff = line.split("|")
    hash[buff[0]] = buff[1].gsub("\n","")
  end
end

read_file_to_hash( vi, hash_vi )
read_file_to_hash( ja, hash_ja )

hash_link = Hash.new
hash_data = Hash.new
read_file_link(file_link, hash_link)
ja_t = String.new
vi_t = String.new

hash_link.each do |ja_link, vi_link|
  ja_t = ""
  vi_t = ""
  if ja_link.include?" "
    ja_link.split.each do |jl|
      ja_t += hash_ja[jl]
      ja_t += " "
    end
    next
  else
    ja_t = hash_ja[ja_link]
  end

  if vi_link.include?" "
    vi_link.split.each do |vl|
      vi_t += hash_vi[vl]
      vi_t += " "
    end
    next
  else
    vi_t = hash_vi[vi_link]
  end
  hash_data[vi_t] = ja_t
end

# puts hash_data
file_out_ja = File.open(name_out_ja, "w")
file_out_vi = File.open(name_out_vi, "w")

hash_data.each do |out_vi, out_ja|
  if !out_vi.nil? && !out_ja.nil?
    file_out_ja.puts( out_ja + "\n" )
    file_out_vi.puts( out_vi + "\n" )
  end
end 

puts "success corpus #{file_in_vi} #{file_in_ja}"