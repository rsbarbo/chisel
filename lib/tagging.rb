require_relative "chisel_file"

class Tagging

  attr_reader :close_translated_tags

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
