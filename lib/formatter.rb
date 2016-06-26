require_relative "chisel_file"

class Formatter

  def header_formatter(text)
    counter = text.count("#")
    text.gsub("#{"#" * counter}", "<h#{counter}>") + "</h#{counter}>"
  end

  def paragraph_formatter(text)
    "<p>\n" + (text) + "\n</p>\n"
  end

end
