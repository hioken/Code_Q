require 'minitest/autorun'
require_relative './hakutyumu.rb'

class HakutyumuTest < Minitest::Test
  def test_judge
    assert_equal "YES", judge("dreamdreamer")
  end
end
