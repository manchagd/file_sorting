require_relative "../src/challenge/builder.rb"

namespace :challenge do
  desc "Setup challenge resources"
  task :setup do
    builder = Challenge::Builder.new(10)
    builder.run!
  end
end
