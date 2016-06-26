require "minitest/autorun"
require "minitest/pride"
require "./lib/list_converter"
require "pry"

class ListConverterTest<Minitest::Test

  attr_reader :list

  def setup
    @list = ListConverter.new
  end

  def test_convert_unordered_list
    assert_equal  "<ul>\n<li>Rapha</li>\n</ul>\n", list.convert_unordered_list("* Rapha")
  end

  def test_convert_ordered_list
    assert_equal  "<ol>\n<li>Rapha</li>\n</ol>\n", list.convert_ordered_list("1. Rapha")
  end

end
