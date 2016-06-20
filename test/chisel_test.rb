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

def test_text_into_paragraph
  assert_equal "<p>Raphael</p>", chisel.header_parser("Raphael")
end

end
