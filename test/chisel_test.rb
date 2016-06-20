require "minitest/autorun"
require "minitest/pride"
require "./lib/chisel"

class ChiselTest<Minitest::Test

attr_reader :chisel

def setup
  @chisel = Chisel.new
end

def test_turn_pound_into_header
  assert_equal "<h1>Raphael</h1>", chisel.header_parser("#Raphael")
end

def test_turn_pound_into_header1_2_3_4_etc
  assert_equal "<h2>Raphael</h2>", chisel.header_parser("##Raphael")
end

def test_text_into_paragraph
  assert_equal "<p>Raphael</p>", chisel.header_parser("Raphael")
end

def test_text_into_same_paragraph_even_with_multiple_lines
  assert_equal "<p>Raphael\n You are the best</p>", chisel.header_parser("Raphael\n You are the best")
end

def test_test
  assert_equal "<p>\nRaphael Raphael Raphael\n</p>\n", chisel.paragraph_parser("Raphael Raphael Raphael")
end

end
