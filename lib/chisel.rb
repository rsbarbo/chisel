require "pry"

class Chisel

def header_parser(text)
  if text.include?("#")
    counter = text.count("#")
    text.gsub("#", "<h#{counter}>") + "</h#{counter}>"
  end
end

end
