require 'fileutils'

class FileSorting
  def self.run!
    dir_name = "../result"
    Dir.mkdir(dir_name) unless Dir.exists?(dir_name)
    Dir.chdir("../result") do
      ('a'..'z').to_a.each do |l| 
        FileUtils.mkdir_p("./#{l}") unless Dir.exists?("./#{l}")
      end
      
    Dir.chdir("../test_cases") do 
      files = Dir.entries(".")
      text = files.each do |f|
        File.open(f).readline
      end 
      file_name = text.map do |t|
        t.gsub("title ", "")
      end

    Dir.chdir(dir_name)
    d = Dir.glob("*")
    file_name.each do |name|
      File.new(name)
    end
    if name[0] == d[0..1]


    end
  end
end

FileSorting.run!