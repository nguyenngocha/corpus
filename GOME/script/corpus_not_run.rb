file_in_ja = ARGV[0]
file_in_vi = ARGV[1]
name_out_ja = file_in_ja.gsub("txt", "corpus")
name_out_vi = file_in_vi.gsub("txt", "corpus")

hash_vi = Hash.new
hash_ja = Hash.new

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

vi = open(file_in_vi, "r")
ja = open(file_in_ja, "r")
read_file_to_hash( vi, hash_vi )
read_file_to_hash( ja, hash_ja )

hash_data = Hash.new()
hash_vi.keys.each do |key|
  hash_data[hash_vi[key]] = hash_ja[key]
end 

# # hash_link.each do |ja_link, vi_link|
# #   if !hash_vi.keys.include?(vi_link) || !hash_ja.keys.include?(ja_link)
# #     next
# #   else
# #     hash_data[hash_vi[vi_link]] = hash_ja[ja_link] 
# #   end
# # end

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