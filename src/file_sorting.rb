require 'fileutils'

class FileSorting
  def self.run!
    dir_name = "../result"
    Dir.mkdir(dir_name) unless Dir.exists?(dir_name)
    Dir.chdir("../result") do
      ('a'..'z').to_a.each do |l| 
        FileUtils.mkdir_p("./#{l}") unless Dir.exists?("./#{l}")
      end
    end
      
    Dir.chdir("../test_cases") do 
      files = Dir.entries(".")
      text = files.each do |f|
        File.open("#{f}").readline
      end 
      file_name = text.map do |t|
        t.gsub("title ", "")
      end
    end
            
    Dir.chdir(dir_name) do
    d = Dir.glob("*")
    # first_letter = file_name.map { |a| a[0] }
    file_name.each do |name, d|
      if name[0] == "#{d}"
        Dir.chdir("./#{d}") do 
        File.new("#{name}") unless File.exist?("#{name}")
        end
      end
    end
  end

    # file_name.each do |d, file_name|
    #   Dir.chdir("./#{d}") do
    #   if "#{first_letter}" == "#{d}"
    #     File.new("#{file_name}")
    #   end
  end
end

FileSorting.run!