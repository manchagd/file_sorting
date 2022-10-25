require_relative "../src/challenge/builder.rb"

namespace :challenge do
  desc "Setup challenge resources"
  task :setup do
    builder = Challenge::Builder.new(10)
    builder.build
  end

  desc "Clean the workdone"
  task :clean do
    result_path = File.join(".", "result")
    test_cases_path = File.join(".", Challenge::Builder::DIR_NAME)

    FileUtils.remove_dir(result_path) if Dir.exist?(result_path)
    FileUtils.remove_dir(test_cases_path) if Dir.exist?(test_cases_path)
  end
end
