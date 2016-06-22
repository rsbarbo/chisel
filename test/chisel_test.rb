require "minitest/autorun"
require "minitest/pride"
require "./lib/chisel_file"
require "pry"

class ChiselFileTest<Minitest::Test

attr_reader :chisel

def setup
  @chisel = ChiselFile.new
end

def test_turn_pound_into_header
  assert_equal "<h1>Raphael</h1>", chisel.parser("#Raphael")
end

def test_turn_pound_into_header2
  assert_equal "<h2>Raphael</h2>", chisel.parser("##Raphael")
end

def test_turn_pound_into_header3
  assert_equal "<h3>Raphael</h3>", chisel.parser("###Raphael")
end


def test_text_into_paragraph
  assert_equal "<p>\nRaphael\n</p>\n", chisel.parser("Raphael")
end

def test_text_into_same_paragraph_even_with_multiple_lines
  assert_equal "<p>\nRaphael\n You are the best\n</p>\n", chisel.parser("Raphael\n You are the best")
end

def test_paragraph
  assert_equal "<p>\nRaphael Raphael Raphael\n</p>\n", chisel.parser("Raphael Raphael Raphael")
end

def test_emphasized_text
assert_equal "<em>", chisel.translate_to_tag("*")
end

def test_strong_text
assert_equal "<strong>", chisel.translate_to_tag("**")
end


def test_translate_strong_text_in_the_middle_of_the_phrase
assert_equal "Hello <strong>Raphael", chisel.translate_to_tag("Hello **Raphael")
end

end
