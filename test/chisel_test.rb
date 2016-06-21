require "minitest/autorun"
require "minitest/pride"
require "./lib/chisel"
require "pry"

class ChiselTest<Minitest::Test

attr_reader :chisel

def setup
  @chisel = Chisel.new
end

def test_turn_pound_into_header
  assert_equal "<h1>Raphael</h1>", chisel.header_formatter("#Raphael")
end

def test_turn_pound_into_header2
  assert_equal "<h2>Raphael</h2>", chisel.header_formatter("##Raphael")
end

def test_turn_pound_into_header3
  assert_equal "<h3>Raphael</h3>", chisel.header_formatter("###Raphael")
end


def test_text_into_paragraph
  assert_equal "<p>Raphael</p>", chisel.header_formatter("Raphael")
end

def test_text_into_same_paragraph_even_with_multiple_lines
  assert_equal "<p>Raphael\n You are the best</p>", chisel.header_formatter("Raphael\n You are the best")
end

def test_test
  assert_equal "<p>\nRaphael Raphael Raphael\n</p>\n", chisel.paragraph_formatter("Raphael Raphael Raphael")
end

end
