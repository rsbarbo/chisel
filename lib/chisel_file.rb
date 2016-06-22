require "pry"
require_relative "file_reader"

class ChiselFile


def encode_to_html(input_read)
    parser(input_read)
end

def parser(input)
  if input.include?("#")
  header_formatter(input)
  else
    paragraph_formatter(input)
  end
end

def header_formatter(text)
    counter = text.count("#")
    text.gsub("#{"#" * counter}", "<h#{counter}>") + "</h#{counter}>"
    binding.pry
end

def something
    text.insert(0, "<p>") + "</p>"
end

def paragraph_formatter(text)
  "<p>\n" + (text) + "\n</p>\n"
end




end
