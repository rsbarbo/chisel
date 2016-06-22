require "pry"
require_relative "file_reader"

class ChiselFile

attr_accessor :final_text

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
  @final_text = sorted_text.join("\n")
  emphasized_text(final_text)
end

def header_formatter(text)
      counter = text.count("#")
      text.gsub("#{"#" * counter}", "<h#{counter}>") + "</h#{counter}>"
end

def paragraph_formatter(text)
  "<p>\n" + (text) + "\n</p>\n"
end

def emphasized_text(final_text)
  final_text.gsub!("**", "<strong>") if final_text.include?("**")
  final_text.gsub!("*", "<em>") if final_text.include?("*")
  final_text
end

end
