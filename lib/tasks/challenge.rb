require_relative "../src/challenge/builder.rb"

namespace :challenge do
  desc "Setup challenge resources"
  task :setup do
    builder = Challenge::Builder.new(10)
    builder.build
  end

  desc "Clean the workdone"
  task :clean do
    dir_path = File.join(".", "result")
    FileUtils.remove_dir(dir_path) if Dir.exist?(dir_path)
  end
end
