require "pry"
require_relative "file_reader"

class ChiselFile

  attr_reader :reader

  def initialize
    @reader = FileReader.new
  end

def something
    markdown = reader.read
    parser(markdown)
end


def parser(input)
  if input.include?("#")
  header_formatter(input)
  else
    paragraph_formatter(input)
  end
end


def header_formatter(input)
  if input.include?("#")
    counter = input.count("#")
    input.gsub("#{"#" * counter}", "<h#{counter}>") + "</h#{counter}>"  else
    input.insert(0, "<p>") + "</p>"
  end
end

def paragraph_formatter(input)
  "<p>\n" + (input) + "\n</p>\n"
end

end
