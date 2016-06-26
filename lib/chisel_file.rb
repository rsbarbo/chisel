require "pry"
require_relative "file_reader"
require_relative "tagging"
require_relative "list_converter"

class ChiselFile

  attr_accessor :final_text,
                :formatter,
                :list_converter,
                :tagging

  def initialize
    @formatter = Formatter.new
    @list_converter = ListConverter.new
    @tagging = Tagging.new
  end

  def parser(text)
    prepare_text = text.chomp("\n").split("\n\n")
    sorted_text = []
    prepare_text.map do |line|
      unless line.start_with?("*", "#") || line[0].to_i > 0
        sorted_text << formatter.paragraph_formatter(line)
      end
      if line.start_with?("#")
        sorted_text << formatter.header_formatter(line)
      elsif line.start_with?("*") && line[1] == " "
        sorted_text << list_converter.convert_unordered_list(line)
      elsif line.start_with?("1") && line[1] == "."
        sorted_text << list_converter.convert_ordered_list(line)
      end
    end
    @final_text = sorted_text.join("\n")
    tagging.close_translated_tags(final_text)
  end

end
