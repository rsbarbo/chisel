require "minitest/autorun"
require "minitest/pride"
require "./lib/formatter"
require "pry"

class FormatterTest<Minitest::Test

  attr_reader :formatter

  def setup
    @formatter = Formatter.new
  end

  def test_format_header
    assert_equal  "<h2> Rapha</h2>", formatter.header_formatter("## Rapha")
  end

  def test_format_paragraph
    assert_equal "<p>\nRapha\n</p>\n", formatter.paragraph_formatter("Rapha")
  end

end
