require "pry"

class Chisel

def header_formatter(text)
  if text.include?("#")
    counter = text.count("#")
    text.gsub("#{"#" * counter}", "<h#{counter}>") + "</h#{counter}>"  else
    text.insert(0, "<p>") + "</p>"
  end
end

def paragraph_formatter(text)  
  "<p>\n" + (text) + "\n</p>\n"
end

end
