require "rspec"
require "rake"
require "pry"
require_relative "../src/file_sorting"

RSpec.describe FileSorting do
  before(:all) do
    %x'rake challenge:clean_test_cases'
    %x'rake challenge:clean_result'
    %x'rake challenge:setup'
  end

  before { described_class.run! }

  after { %x'rake challenge:clean_result' }

  after(:all) { %x'rake challenge:clean_test_cases' }

  describe ".run!" do
    let(:result_path) { [".", "result"] }

    ("a".."z").each do |letter|
      it "creates a dir with letter '#{letter}'" do
        dir_path = Dir[File.join(*[*result_path, "*"])]
        letter_dir_path = File.join(*[*result_path, letter])

        expect(dir_path).to include(letter_dir_path)
      end
    end

    ("a".."z").each do |letter|
      it "moves all the files that start with #{letter} in the title" do
        letter_dir_files = Dir[File.join(*[*result_path, letter, "*"])]
        file_path_regex = /\.\/result\/#{letter}\/#{letter}\w+/

        expect(letter_dir_files.any?).to be_truthy
        expect(letter_dir_files.any? { |file_path| !(file_path_regex =~ file_path) }).to be_falsy
      end
    end

    ("a".."z").each do |letter|
      it "rename each file with the title inside the file" do
        letter_dir_files = Dir[File.join(*[*result_path, letter, "*"])]
        file_path_regex = /\.\/result\/#{letter}\/(?<file_name>#{letter}\w+)/

        expect(letter_dir_files.any?).to be_truthy
        letter_dir_files.each do |file_path|
          file_name = file_path[file_path_regex, :file_name]
          file_title = File.read(file_path)[/title (?<file_name>#{file_name})/, :file_name]

          expect(file_title).not_to be_nil
          expect(file_name).to eq(file_title)
        end
      end
    end
  end
end
