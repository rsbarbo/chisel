
require "minitest/autorun"
require "minitest/pride"
require "./lib/tagging"
require "pry"

class TaggingTest<Minitest::Test

  attr_reader :tagging

  def setup
    @tagging = Tagging.new
  end


  def test_emphasized_text
    assert_equal "<em>", tagging.translate_to_tag("*")
  end

  def test_strong_text
    assert_equal "<strong>", tagging.translate_to_tag("**")
  end


  def test_translate_strong_text_in_the_middle_of_the_phrase
    assert_equal "Hello <strong>Raphael", tagging.translate_to_tag("Hello **Raphael")
  end

end
