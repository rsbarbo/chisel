require "pry"
require_relative "file_reader"

class ChiselFile


def parser(text)
  prepare_text = text.chomp("\n").split("\n\n")
  sorted_text = []
  prepare_text.map do |string|
    unless string.start_with?("#") || string[0].to_i > 0
      sorted_text << paragraph_formatter(string)
    end
  end
end

def header_formatter(text)
      counter = text.count("#")
      text.gsub("#{"#" * counter}", "<h#{counter}>") + "</h#{counter}>"
end

def paragraph_formatter(text)
  "<p>\n" + (text) + "\n</p>\n"
end

end
