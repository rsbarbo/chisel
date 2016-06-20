require "pry"

class Chisel

def header_parser(text)
  if text.include?("#")
    counter = text.count("#")
    text.gsub!("#", "<h#{counter}>") + "</h#{counter}>"
  else
    text.insert(0, "<p>") + "</p>"
  end
end

end
