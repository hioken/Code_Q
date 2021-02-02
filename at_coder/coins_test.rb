require 'minitest/autorun'
require_relative './coins.rb'

class Coins < Minitest::Test
  def test_pattern
    assert_equal 213, pattern([30, 40, 50], 6000)
  end

end
