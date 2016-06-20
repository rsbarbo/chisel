require "minitest/autorun"
require "minitest/pride"
require "./lib/chisel"

class ChiselTest<Minitest::Test


def test_translate_pound_into_header
  chisel = Chisel.new
  assert_equal "<h1>Raphael</h1>", chisel.header_parser("#Raphael")
end

end
