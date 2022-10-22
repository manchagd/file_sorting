# frozen_string_literal: true
require 'fileutils'

module Challenge
  class Builder
    FILES_COUNT = 20.freeze
    DIR_NAME = "test_cases"
    LETTERS = ("a".."z").to_a.freeze

    attr_reader :size

    def initialize(size)
      @size = size
    end

    def run!
      build_folder
      build_files
    end

    private

    def build_folder
      FileUtils.remove_dir(dir_path) if Dir.exist?(dir_path)
      FileUtils.mkdir(dir_path)
    end

    def build_files
      LETTERS.each.with_index do |letter, i|
        FILES_COUNT.times do |n|
          file_name = "unknown-#{i*FILES_COUNT+n}"
          title = generate_title(letter)
          File.write(File.join(dir_path, file_name), file_content(title))
        end
      end
    end

    def dir_path
      File.join(".", DIR_NAME)
    end

    def generate_title(letter)
      "#{letter}#{LETTERS.sample(10).join}"
    end

    def file_content(title)
      "title #{title}\n" \
      "\n" \
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt\n" \
      "ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco \n" \
      "laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in\n" \
      "voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat\n"\
      "non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    end
  end
end
