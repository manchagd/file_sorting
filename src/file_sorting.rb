require 'fileutils'
require 'pry'

class FileSorting
  def self.run!
    Dir.mkdir("./result") unless Dir.exists?("./result")
    ('a'..'z').to_a.each do |l| 
      FileUtils.mkdir_p("./result/#{l}") unless Dir.exists?("./result/#{l}")
    end
      
    files = Dir.glob("./test_cases/*")
    files.each do |f| 
      title = File.readlines("#{f}").first.chomp.split.last
      text = File.read("#{f}")
      File.write("./result/#{title[0]}/#{title}", text)
    end
  end
end

FileSorting.run!