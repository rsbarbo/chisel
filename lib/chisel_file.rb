require "pry"
require_relative "file_reader"

class ChiselFile


def parser(text)
  prepare_text = text.chomp("\n").split("\n\n")
  sorted_text = []
  prepare_text.map do |line|
    unless line.start_with?("#") || line[0].to_i > 0
      sorted_text << paragraph_formatter(line)
    end
      if line.start_with?("#")
        sorted_text << header_formatter(line)
    end
  end
  sorted_text.join("\n")
end

def header_formatter(text)
      counter = text.count("#")
      text.gsub("#{"#" * counter}", "<h#{counter}>") + "</h#{counter}>"
end

def paragraph_formatter(text)
  "<p>\n" + (text) + "\n</p>\n"
end

end
