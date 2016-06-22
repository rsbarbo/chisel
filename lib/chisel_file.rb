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
  close_translated_tags(final_text)
end

def header_formatter(text)
      counter = text.count("#")
      text.gsub("#{"#" * counter}", "<h#{counter}>") + "</h#{counter}>"
end

def paragraph_formatter(text)
  "<p>\n" + (text) + "\n</p>\n"
end

def translate_to_tag(final_text)
  final_text.gsub!("**", "<strong>") if final_text.include?("**")
  final_text.gsub!("*", "<em>") if final_text.include?("*")
  final_text
end

def close_translated_tags(final_text)
tags_closed = translate_to_tag(final_text).split(/ /).map do |eachword|
  if eachword.end_with?("<strong>")
    eachword.chomp("<strong>") + "</strong>"
  elsif eachword.end_with?("<em>")
    eachword.chomp("<em>") + "</em>"
  else
    eachword
  end
end
tags_closed.join(" ")
end

end
